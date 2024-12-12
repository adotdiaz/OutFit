//
//  ContentView.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill") // Home icon
                    Text("Home")
                }
            
            ClosetView()
                .tabItem {
                    Image(systemName: "person.crop.rectangle") // Closet icon
                    Text("Closet")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill") // Settings icon
                    Text("Settings")
                }
        }
        .accentColor(.blue) // Customize the tab bar highlight color
    }
}

#Preview {
    ContentView()
}
