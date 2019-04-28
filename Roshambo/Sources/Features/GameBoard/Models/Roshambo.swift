//
//  Roshambo.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

enum Roshambo: CaseIterable {
    case scissors
    case rock
    case paper
}

extension Roshambo: Equatable {
    static func ==(lhs: Roshambo, rhs: Roshambo) -> Bool {
        switch (lhs, rhs) {
            case (.scissors, .scissors):
                return true
            case (.rock, .rock):
                return true
            case (.paper, .paper):
                return true
            default:
                return false
        }
    }
}

extension Roshambo {
    var displayImage: UIImage {
        switch self {
            case .scissors:
                return UIImage(named: "icon_scissors")!
            case .rock:
                return UIImage(named: "icon_rock")!
            case .paper:
                return UIImage(named: "icon_paper")!
        }
    }
}
