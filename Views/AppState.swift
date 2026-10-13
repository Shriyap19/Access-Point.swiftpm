//
//  AppState.swift
//  Access Point
//
//  Created by Shriya Patel on 7/3/26.
//
import SwiftUI

class AppState: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var organization: String = ""
    @Published var notifications: Bool = true
    @Published var location: Bool = true
    @Published var camera: Bool = true
    @Published var photos: Bool = true
    @Published var isLoggedIn: Bool = false
}
