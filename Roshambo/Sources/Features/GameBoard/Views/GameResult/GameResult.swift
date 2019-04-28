//
//  GameResult.swift
//  Roshambo
//
//  Created by Christian Elies on 25.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

enum GameResult {
    case computerWins(roshambo: Roshambo)
    case draw
    case none
    case playerWins(roshambo: Roshambo)
}

extension GameResult: Equatable {
    static func ==(lhs: GameResult, rhs: GameResult) -> Bool {
        switch (lhs, rhs) {
            case (.computerWins(let lhsRoshambo), .computerWins(let rhsRoshambo)):
                return lhsRoshambo == rhsRoshambo
            case (.draw, .draw):
                return true
            case (.none, .none):
                return true
            case (.playerWins(let lhsRoshambo), .playerWins(let rhsRoshambo)):
                return lhsRoshambo == rhsRoshambo
            default:
                return false
        }
    }
}
