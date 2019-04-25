//
//  CACornerMask+Corners.swift
//  Roshambo
//
//  Created by Christian Elies on 25.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

extension CACornerMask {
    static var TopLeftCorner = CACornerMask.layerMinXMinYCorner
    static var TopRightCorner = CACornerMask.layerMaxXMinYCorner
    static var BottomRightCorner = CACornerMask.layerMaxXMaxYCorner
    static var BottomLeftCorner = CACornerMask.layerMinXMaxYCorner
    static var AllCorners: CACornerMask = [.TopLeftCorner, .TopRightCorner, .BottomRightCorner, .BottomLeftCorner]
}
