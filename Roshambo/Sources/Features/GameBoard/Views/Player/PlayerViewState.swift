//
//  PlayerViewState.swift
//  Roshambo
//
//  Created by Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import UIKit

enum PlayerViewState {
    case initial
    case takeAction
    case result(roshambo: Roshambo)
}

extension PlayerViewState {
    var displayText: String {
        switch self {
            case .initial:
                return "You first 😉"
            case .takeAction:
                return ""
            case .result(let roshambo):
                return roshambo.displayText
        }
    }
}
