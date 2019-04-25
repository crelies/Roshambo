//
//  UIView+RoundCorners.swift
//  Roshambo
//
//  Created by Christian Elies on 25.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(cornerMask: CACornerMask, cornerRadius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = cornerMask
    }
}
