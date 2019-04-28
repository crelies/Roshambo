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
    var displayImage: UIImage? {
        switch self {
            case .initial:
                return UIImage(named: "icon_question_mark")!
            case .result(let roshambo):
                return roshambo.displayImage
            default:
                return nil
        }
    }
}
