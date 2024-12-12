//
//  PersistenceController.swift
//  Out Fit
//
//  Created by Alexis Diaz on 12/9/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "OutFit") // Match .xcdatamodeld name
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    func resetData() {
        let storeCoordinator = container.persistentStoreCoordinator

        for store in storeCoordinator.persistentStores {
            if let storeURL = store.url {
                do {
                    try storeCoordinator.destroyPersistentStore(at: storeURL, ofType: store.type, options: nil)
                } catch {
                    print("Failed to destroy persistent store: \(error.localizedDescription)")
                }
            } else {
                print("Persistent store URL is nil.")
            }
        }

        // Reload the persistent stores after resetting
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }

}
