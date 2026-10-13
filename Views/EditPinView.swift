//
//  EditPinView.swift
//  Access Point
//
//  Created by Shriya Patel on 7/30/26.
//

import SwiftUI

struct EditPinView: View {
    @State private var name: String
    @State private var color: Color
    @State private var systemImage: String

    let marker: MapMarkerItem
    let onSave: (MapMarkerItem) -> Void
    let onCancel: () -> Void

    private let iconOptions = ["mappin", "house.fill", "figure.roll", "star.fill", "flag.fill", "bell.fill"]

    init(marker: MapMarkerItem, onSave: @escaping (MapMarkerItem) -> Void, onCancel: @escaping () -> Void) {
        self.marker = marker
        self.onSave = onSave
        self.onCancel = onCancel
        _name = State(initialValue: marker.name)
        _color = State(initialValue: marker.color)
        _systemImage = State(initialValue: marker.systemImage)
    }

    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Pin name", text: $name)
                }

                Section("Color") {
                    ColorPicker("Pin color", selection: $color)
                }

                Section("Icon") {
                    Picker("Icon", selection: $systemImage) {
                        ForEach(iconOptions, id: \.self) { icon in
                            Label(icon, systemImage: icon).tag(icon)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("Edit Pin")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { onCancel() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        var updated = marker
                        updated.name = name
                        updated.color = color
                        updated.systemImage = systemImage
                        onSave(updated)
                    }
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}
