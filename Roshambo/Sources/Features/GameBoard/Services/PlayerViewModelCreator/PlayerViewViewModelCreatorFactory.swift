//
//  PlayerViewViewModelCreatorFactory.swift
//  Roshambo
//
//  Created Christian Elies on 24.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//
//  Template generated by Christian Elies @crelies
//

import Foundation

protocol PlayerViewViewModelCreatorFactoryProtocol {
	static func makePlayerViewViewModelCreator() -> PlayerViewViewModelCreatorProtocol
}

final class PlayerViewViewModelCreatorFactory: PlayerViewViewModelCreatorFactoryProtocol {
	static func makePlayerViewViewModelCreator() -> PlayerViewViewModelCreatorProtocol {
		let dependencies = PlayerViewViewModelCreatorDependencies()
		return PlayerViewViewModelCreator(dependencies: dependencies)
	}
}
