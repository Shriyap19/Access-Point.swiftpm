//
//  MapView.swift
//  Access Point
//
//  Created by Shriya Patel on 7/21/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var markers: [MapMarkerItem] = [
        MapMarkerItem(
            name: "Princeton House",
            coordinate: CLLocationCoordinate2D(latitude: 40.3431, longitude: -74.6551),
            systemImage: "house.fill",
            color: .red
        ),
        MapMarkerItem(
            name: "Accessible Spot",
            coordinate: CLLocationCoordinate2D(latitude: 40.3480, longitude: -74.6590),
            systemImage: "figure.roll",
            color: .blue
        )
    ]

    @State private var isAddingPin = false
    @State private var pendingCoordinate: CLLocationCoordinate2D?
    @State private var pendingPinName = ""
    @State private var showNamePrompt = false
    @State private var showPicker = false
    @State private var pinType = ""
    @State private var showOther = false

    @State private var editingMarkerID: UUID?
    @State private var markerPendingDeletion: UUID?
    @State private var showDeleteConfirm = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            MapViewRepresentable(
                markers: $markers,
                isAddingPin: $isAddingPin,
                onTapToAdd: { coordinate in
                    pendingCoordinate = coordinate
                    pendingPinName = ""
                    showNamePrompt = true
                    showPicker = true
                },
                onEditRequested: { id in
                    editingMarkerID = id
                },
                onDeleteRequested: { id in
                    markerPendingDeletion = id
                    showDeleteConfirm = true
                },
                onDragEnded: { id, newCoordinate in
                    if let index = markers.firstIndex(where: { $0.id == id }) {
                        markers[index].coordinate = newCoordinate
                    }
                }
            )
            .edgesIgnoringSafeArea(.all)

            addPinButton
                .padding(.top, 16)
                .padding(.trailing, 16)

            if isAddingPin {
                Text("Tap anywhere on the map to place a pin")
                    .font(.caption)
                    .bold()
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color(.systemBackground).opacity(0.9))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 16)
            }
        }
        .alert("Name the pin and choose the type", isPresented: $showPicker)
            {
                VStack {
                    
                    TextField("New Pin Name",text:$pendingPinName)
                        
                        Button("Ramp"){
                            pinType = "Ramp"
                            savePendingPin()
                            pinType = ""
                        
                        }
                        Button("Accessable parking"){
                            pinType = "Accessable parking"
                            savePendingPin()
                            pinType = ""
                        }
                        Button("Stairlift"){
                            pinType = "Stairlift"
                            savePendingPin()
                            pinType = ""
                        }
                        Button("Other"){
                            pinType = "Other"
                            savePendingPin()
                            pinType = ""
                        }

                Button("Cancel", role: .cancel) { pendingCoordinate = nil }
//                Button("Save") {
//                   savePendingPin()
//                   pinType = ""
//                  }
                    
                }
        }
//            .alert("Name this pin", isPresented: $showOther){
//                TextField("Pin name", text:$pendingPinName)
//                Button("Cancel", role: .cancel) { pendingCoordinate = nil }
//                Button("Save") {
//                savePendingPin()
//                pinType = ""
//            }
//            }
//        .alert("Name this pin", isPresented: $showNamePrompt) {
//            TextField("Pin name", text: $pendingPinName)
//            Button("Cancel", role: .cancel) { pendingCoordinate = nil }
//            Button("Save") { savePendingPin() }
//        } message: {
//            Text("Enter a label for the location you tapped.")
//        }
        .alert("Delete this pin?", isPresented: $showDeleteConfirm) {
            Button("Cancel", role: .cancel) { markerPendingDeletion = nil }
            Button("Delete", role: .destructive) { confirmDelete() }
        } message: {
            Text("This can't be undone.")
        }
        .sheet(item: Binding(
            get: { markers.first(where: { $0.id == editingMarkerID }) },
            set: { _ in }
        )) { marker in
            EditPinView(marker: marker) { updated in
                if let index = markers.firstIndex(where: { $0.id == updated.id }) {
                    markers[index] = updated
                }
                editingMarkerID = nil
            } onCancel: {
                editingMarkerID = nil
            }
        }
    }

    private var addPinButton: some View {
        Button {
            isAddingPin.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(14)
                .background(isAddingPin ? Color.red : Color.blue)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
    }

    private func savePendingPin() {
        guard let coordinate = pendingCoordinate,
              !pendingPinName.trimmingCharacters(in: .whitespaces).isEmpty else {
            pendingCoordinate = nil
            return
        }
        if pinType == "Ramp" {
            markers.append(
                MapMarkerItem(
                    name: pendingPinName,
                    coordinate: coordinate,
                    systemImage: "figure.roll",
                    color: .green
                )
            )
        }
        if pinType == "Accessable parking" {
            markers.append(
                MapMarkerItem(
                    name: pendingPinName,
                    coordinate: coordinate,
                    systemImage: "accessibility",
                    color: .blue
                )
            )
        }
        if pinType == "Stairlift"{
            markers.append(
                MapMarkerItem(
                    name: pendingPinName,
                    coordinate: coordinate,
                    systemImage: "arrow.up.and.down",
                    color: .red
                )
            )
        }
        if pinType == "Other"{
            markers.append(
                MapMarkerItem(
                    name: pendingPinName,
                    coordinate: coordinate,
                    systemImage: "mappin",
                    color: .orange
                )
            )
        }
        

        pendingCoordinate = nil
        pendingPinName = ""
        isAddingPin = false
    }

    private func confirmDelete() {
        guard let id = markerPendingDeletion else { return }
        markers.removeAll { $0.id == id }
        markerPendingDeletion = nil
    }
}
