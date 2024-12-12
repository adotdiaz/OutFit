//
//  SettingsView.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/20/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedColor: Color = .blue // Selected color for the palette
    @State private var isPrivate: Bool = false     // Example privacy option
    @State private var showProfileDetails: Bool = true

    var body: some View {
        NavigationView {
            Form {
                // Color Palette Selection Section
                Section(header: Text("Color Palette")) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 20) {
                        ForEach(colorOptions, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Circle()
                                        .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 3)
                                )
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                }
                
                // Privacy Settings Section
                Section(header: Text("Privacy Settings")) {
                    Toggle("Make Profile Private", isOn: $isPrivate)
                    Toggle("Show Profile Details", isOn: $showProfileDetails)
                }
                
                // App Settings Section
                Section(header: Text("App Settings")) {
                    Button("Reset App Data") {
                        PersistenceController.shared.resetData()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    // Color options for the palette
    private var colorOptions: [Color] {
        [.red, .blue, .green, .yellow, .orange, .pink, .purple, .gray]
    }
}

#Preview {
    SettingsView()
}
