//
//  MapPinAnnotation.swift
//  Access Point
//
//  Created by Shriya Patel on 7/28/26.
//
import SwiftUI
import MapKit

class MapPinAnnotation: NSObject, MKAnnotation {
    let id: UUID
    @objc dynamic var coordinate: CLLocationCoordinate2D // now mutable + KVO-observable
    var markerTitle: String
    var systemImage: String
    var color: Color

    var title: String? { markerTitle }

    init(item: MapMarkerItem) {
        self.id = item.id
        self.coordinate = item.coordinate
        self.markerTitle = item.name
        self.systemImage = item.systemImage
        self.color = item.color
    }
}
