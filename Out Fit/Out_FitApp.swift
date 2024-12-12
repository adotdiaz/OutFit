//
//  Out_FitApp.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/20/24.
//

import SwiftUI

@main
struct Out_FitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
