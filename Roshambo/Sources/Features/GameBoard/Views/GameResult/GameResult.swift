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
