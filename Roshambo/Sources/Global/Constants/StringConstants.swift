//
//  StringConstants.swift
//  Roshambo
//
//  Created by Elies, Christian on 29.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

struct StringConstants {
    struct GameBoard {
        struct PlayerName {
            static let you = "GameBoard.PlayerName.you".localized
            static let computer = "GameBoard.PlayerName.computer".localized
        }
    }
}

extension StringConstants {
    struct GameResult {
        static let computerWins = "GameResult.computerWins".localized
        static let draw = "GameResult.draw".localized
        static let none = "GameResult.none".localized
        static let playerWins = "GameResult.playerWins".localized
    }
}
