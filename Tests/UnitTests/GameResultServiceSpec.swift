//
//  GameResultServiceSpec.swift
//  GameResultServiceSpec
//
//  Created by Christian Elies on 28.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

@testable import Roshambo
import XCTest

final class GameResultServiceSpec: XCTestCase {
    let service = GameResultServiceFactory.makeGameResultService()

    func testScissorsRockGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .scissors, computerRoshambo: .rock)
        XCTAssertEqual(gameResult, GameResult.computerWins(roshambo: .rock))
    }
    
    func testScissorsPaperGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .scissors, computerRoshambo: .paper)
        XCTAssertEqual(gameResult, GameResult.playerWins(roshambo: .scissors))
    }
    
    func testRockPaperGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .rock, computerRoshambo: .paper)
        XCTAssertEqual(gameResult, GameResult.computerWins(roshambo: .paper))
    }
    
    func testRockScissorsGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .rock, computerRoshambo: .scissors)
        XCTAssertEqual(gameResult, GameResult.playerWins(roshambo: .rock))
    }
    
    func testPaperScissorsGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .paper, computerRoshambo: .scissors)
        XCTAssertEqual(gameResult, GameResult.computerWins(roshambo: .scissors))
    }
    
    func testPaperRockGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .paper, computerRoshambo: .rock)
        XCTAssertEqual(gameResult, GameResult.playerWins(roshambo: .paper))
    }
    
    func testScissorsScissorsGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .scissors, computerRoshambo: .scissors)
        XCTAssertEqual(gameResult, GameResult.draw)
    }
    
    func testRockRockGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .rock, computerRoshambo: .rock)
        XCTAssertEqual(gameResult, GameResult.draw)
    }
    
    func testPaperPaperGameResult() {
        let gameResult = service.getGameResult(playerRoshambo: .paper, computerRoshambo: .paper)
        XCTAssertEqual(gameResult, GameResult.draw)
    }
}
