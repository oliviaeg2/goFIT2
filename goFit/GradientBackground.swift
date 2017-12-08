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
        let topColor = UIColor(red: 17/255, green: 122/255, blue: 168/255, alpha: 1)
        let bottomColor = UIColor(red: (23/255.0), green: (146/255.0), blue: (197/255.0), alpha: 1)
        
        // Create a CAGradientLayer and set colors and locations
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        
        // Return the newly created layer
        return gradientLayer
    }
}
