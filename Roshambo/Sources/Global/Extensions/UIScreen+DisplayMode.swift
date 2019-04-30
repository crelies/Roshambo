//
//  UIScreen+DisplayMode.swift
//  Roshambo
//
//  Created by Elies, Christian on 30.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

extension UIScreen {
    var isPortrait: Bool {
        return bounds.width < bounds.height
    }
    
    var isLandscape: Bool {
        return bounds.width > bounds.height
    }
}
