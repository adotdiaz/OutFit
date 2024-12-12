//
//  Settings.swift
//  Out Fit
//
//  Created by Alexis Diaz on 11/20/24.
//

import UIKit

class Settings {
    var colorPalette: [UIColor]
    let defaultPalette: [UIColor] = [.gray, .white, .black]
    var isCustomPaletteEnabled: Bool

    init(colorPalette: [UIColor]? = nil) {
        self.colorPalette = colorPalette ?? defaultPalette
        self.isCustomPaletteEnabled = colorPalette != nil
    }
    
    func updatePalette(to newPalette: [UIColor]) {
        colorPalette = newPalette
        isCustomPaletteEnabled = true
    }
    
    func resetToDefault() {
        colorPalette = defaultPalette
        isCustomPaletteEnabled = false
    }
}
