//
//  GradientBackground.swift
//  goFit
//
//  Created by Denis Russu on 11/29/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import Foundation
import UIKit

// Extension on CAGradientLayer for a useful function
extension CAGradientLayer {
    // Simple function called on CAGradientLayer that returns a gradient layer (used for 
    // gradient backgrounds) with the specified top and bottom color
    func lightBlueColor() -> CAGradientLayer {
        // Specify top and bottom colors
        let topColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let bottomColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1)
        
        // Create a CAGradientLayer and set colors and locations
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        
        // Return the newly created layer
        return gradientLayer
    }
}
