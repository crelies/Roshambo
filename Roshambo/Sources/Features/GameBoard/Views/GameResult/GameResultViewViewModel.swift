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
                result = "You lose 🙈"
            case .draw:
                result = "Draw 😛"
            case .none:
                result = "Choose wisely 😉"
            case .playerWins:
                result = "You win 🚀"
        }
    }
}
