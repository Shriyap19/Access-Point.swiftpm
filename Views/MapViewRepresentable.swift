
//
//  Untitled.swift
//  Access Point
//
//  Created by Shriya Patel on 7/28/26.
//

//view needed to act as "bridge" between older MapKit making it so the data can still be used in our code

import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    @Binding var markers: [MapMarkerItem]
    @Binding var isAddingPin: Bool
    var onTapToAdd: (CLLocationCoordinate2D) -> Void
    var onEditRequested: (UUID) -> Void
    var onDeleteRequested: (UUID) -> Void
    var onDragEnded: (UUID, CLLocationCoordinate2D) -> Void

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.3431, longitude: -74.6551),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        mapView.setRegion(region, animated: false)

        let tapGesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handleTap(_:))
        )
        mapView.addGestureRecognizer(tapGesture)

        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        let currentIDs = Set(mapView.annotations.compactMap { ($0 as? MapPinAnnotation)?.id })
        let newIDs = Set(markers.map { $0.id })

        if currentIDs != newIDs {
            let toRemove = mapView.annotations.filter {
                guard let pin = $0 as? MapPinAnnotation else { return false }
                return !newIDs.contains(pin.id)
            }
            mapView.removeAnnotations(toRemove)

            let existingIDs = Set(mapView.annotations.compactMap { ($0 as? MapPinAnnotation)?.id })
            let toAdd = markers.filter { !existingIDs.contains($0.id) }
                .map { MapPinAnnotation(item: $0) }
            mapView.addAnnotations(toAdd)
        }

        context.coordinator.isAddingPin = isAddingPin
        context.coordinator.parent = self
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        var isAddingPin: Bool = false

        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }

        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard isAddingPin, let mapView = gesture.view as? MKMapView else { return }
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            parent.onTapToAdd(coordinate)
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let pin = annotation as? MapPinAnnotation else { return nil }

            let identifier = "pin"
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKMarkerAnnotationView
                ?? MKMarkerAnnotationView(annotation: pin, reuseIdentifier: identifier)

            view.annotation = pin
            view.canShowCallout = true
            view.isDraggable = true // <-- makes the pin movable by touch-and-hold+drag
            view.markerTintColor = UIColor(pin.color)
            view.glyphImage = UIImage(systemName: pin.systemImage)

            // Edit button (pencil) on the left of the callout
            let editButton = UIButton(type: .system)
            editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
            view.leftCalloutAccessoryView = editButton

            // Delete button (trash) on the right of the callout
            let deleteButton = UIButton(type: .system)
            deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
            view.rightCalloutAccessoryView = deleteButton

            return view
        }

        // Fires when either callout accessory button is tapped
        func mapView(
            _ mapView: MKMapView,
            annotationView view: MKAnnotationView,
            calloutAccessoryControlTapped control: UIControl
        ) {
            guard let pin = view.annotation as? MapPinAnnotation else { return }

            if control === view.leftCalloutAccessoryView {
                parent.onEditRequested(pin.id)
            } else if control === view.rightCalloutAccessoryView {
                parent.onDeleteRequested(pin.id)
            }
        }

        // Fires continuously during a drag; we only act once the drag finishes
        func mapView(
            _ mapView: MKMapView,
            annotationView view: MKAnnotationView,
            didChange newState: MKAnnotationView.DragState,
            fromOldState oldState: MKAnnotationView.DragState
        ) {
            guard newState == .ending, let pin = view.annotation as? MapPinAnnotation else { return }
            parent.onDragEnded(pin.id, pin.coordinate)
            view.dragState = .none
        }
    }
}
