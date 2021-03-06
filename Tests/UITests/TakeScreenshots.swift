//
//  TakeScreenshots.swift
//  TakeScreenshots
//
//  Created by Christian Elies on 26.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import XCTest

final class TakeScreenshots: XCTestCase {
    func testTakePortraitScreenshots() {
        let app = XCUIApplication()
        setupSnapshot(app)
        
        XCUIDevice.shared.orientation = .portrait
        
        app.launch()
        
        snapshot("01Initial-Portrait")
        
        app.buttons["✊"].tap()
        
        snapshot("02Result-Portrait")
    }
    
    func testTakeLandscapeScreenshots() {
        let app = XCUIApplication()
        setupSnapshot(app)
        
        XCUIDevice.shared.orientation = .landscapeLeft
        
        app.launch()
        
        snapshot("01Initial-Landscape")
        
        app.buttons["✊"].tap()
        
        snapshot("02Result-Landscape")
    }
}
