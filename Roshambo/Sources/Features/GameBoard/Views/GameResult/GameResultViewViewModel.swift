//
//  GameResultViewViewModel.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

struct GameResultViewViewModel {
    let result: String
}

extension GameResultViewViewModel {
    init(gameResult: GameResult) {
        switch gameResult {
            case .computerWins:
                result = StringConstants.GameResult.computerWins
            case .draw:
                result = StringConstants.GameResult.draw
            case .none:
                result = StringConstants.GameResult.none
            case .playerWins:
                result = StringConstants.GameResult.playerWins
        }
    }
}
