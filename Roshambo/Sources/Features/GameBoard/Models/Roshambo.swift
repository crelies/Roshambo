//
//  Roshambo.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import Foundation

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
    var displayText: String {
        switch self {
            case .scissors:
                return "✌️"
            case .rock:
                return "✊"
            case .paper:
                return "🤚"
        }
    }
}
