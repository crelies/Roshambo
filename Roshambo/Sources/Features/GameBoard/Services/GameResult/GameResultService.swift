//
//  GameResultService.swift
//  Roshambo
//
//  Created Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//
//  Template generated by Christian Elies @crelies
//

import Foundation

protocol GameResultServiceProvider {
	var gameResultService: GameResultServiceProtocol { get }
}

protocol GameResultServiceProtocol {
    func getGameResult(playerRoshambo: Roshambo, computerRoshambo: Roshambo) -> GameResult
}

final class GameResultService {
	private let dependencies: GameResultServiceDependenciesProtocol

	init(dependencies: GameResultServiceDependenciesProtocol) {
		self.dependencies = dependencies
	}
}

extension GameResultService: GameResultServiceProtocol {
    func getGameResult(playerRoshambo: Roshambo, computerRoshambo: Roshambo) -> GameResult {
        switch (playerRoshambo, computerRoshambo) {
            case (.scissors, .rock):
                return .computerWins(roshambo: .rock)
            case (.scissors, .paper):
                return .playerWins(roshambo: .scissors)
            case (.rock, .paper):
                return .computerWins(roshambo: .paper)
            case (.rock, .scissors):
                return .playerWins(roshambo: .rock)
            case (.paper, .scissors):
                return .computerWins(roshambo: .scissors)
            case (.paper, .rock):
                return .playerWins(roshambo: .paper)
            default:
                return .draw
        }
    }
}
