//
//  MapMarkers.swift
//  Access Point
//
//  Created by Shriya Patel on 7/21/26.
//

import SwiftUI
import CoreLocation

struct MapMarkerItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D  
    var systemImage: String = "house.fill"
    var color: Color = .blue
}
