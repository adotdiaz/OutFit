//
//  ClothingItem.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/20/24.
//

import Foundation
import CoreData
import UIKit

@objc(ClothingItem)
class ClothingItem: NSManagedObject, Identifiable {
    @NSManaged var imageData: Data?
    @NSManaged var type: String?
    @NSManaged var name: String?
    @NSManaged var dateAdded: Date?

    var clothingType: ClothingType? {
        guard let type = type else { return nil }
        return ClothingType(rawValue: type)
    }

    var image: UIImage? {
        guard let imageData = imageData else { return nil }
        return UIImage(data: imageData)
    }

    var id: NSManagedObjectID {
        self.objectID
    }
}

enum ClothingType: String, Codable {
    case top
    case bottom
    case shoe
}
