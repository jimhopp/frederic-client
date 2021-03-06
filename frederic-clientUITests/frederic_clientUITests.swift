//
//  frederic_clientUITests.swift
//  frederic-clientUITests
//
//  Created by Jim Hopp on 12/16/16.
//  Copyright © 2016 Jim Hopp. All rights reserved.
//

import XCTest

class frederic_clientUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        app.launchArguments.append("skip-signin")
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDetail() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let clients = ["baggins, frodo", "wolf, thomas"]
        let app = XCUIApplication()
        let tablesQuery = app.tables
        for c in clients {
            tablesQuery.staticTexts[c].tap()
            XCTAssertEqual(c, (app.textFields.element.value as? String), "did not find client name field")
            app.navigationBars[c].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        }
        
    }
    func testAllData() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tablesQuery = XCUIApplication().tables
        //TODO: get actual client count, perhaps when we mock data source
        XCTAssertEqual(tablesQuery.cells.count, 9, "cells count does not match expected clients count")
        
    }
}
