//
//  GameBoardViewModelCreatorDependencies.swift
//  Roshambo
//
//  Created Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//
//  Template generated by Christian Elies @crelies
//

import Foundation

protocol GameBoardViewModelCreatorDependenciesProtocol: PlayerViewViewModelCreatorProvider {
	
}

struct GameBoardViewModelCreatorDependencies: GameBoardViewModelCreatorDependenciesProtocol {
	let playerViewViewModelCreator: PlayerViewViewModelCreatorProtocol
    
    init() {
        playerViewViewModelCreator = PlayerViewViewModelCreatorFactory.makePlayerViewViewModelCreator()
    }
}