//
//  TakeScreenshots.swift
//  TakeScreenshots
//
//  Created by Christian Elies on 26.04.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import XCTest

final class TakeScreenshots: XCTestCase {
    func testTakeScreenshots() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        snapshot("01Initial")
        
        app.buttons["✊"].tap()
        
        snapshot("02Result")
    }
}
