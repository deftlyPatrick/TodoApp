//
//  TodoAppUITests.swift
//  TodoAppUITests
//
//  Created by Patrick Wong on 10/24/18.
//  Copyright © 2018 Patrick Wong. All rights reserved.
//

import XCTest

class TodoAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.keys["H"]/*[[".keyboards.keys[\"H\"]",".keys[\"H\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        mKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["w"]/*[[".keyboards.keys[\"w\"]",".keys[\"w\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        oKey.tap()
        oKey.tap()
        
        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rKey.tap()
        rKey.tap()
        
        let kKey = app/*@START_MENU_TOKEN@*/.keys["k"]/*[[".keyboards.keys[\"k\"]",".keys[\"k\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        kKey.tap()
        kKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["!!"]/*[[".segmentedControls.buttons[\"!!\"]",".buttons[\"!!\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        
        let tablesQuery = app.tables
        let homeworkStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["homework\n"]/*[[".cells.staticTexts[\"homework\\n\"]",".staticTexts[\"homework\\n\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        homeworkStaticText.swipeLeft()
        doneButton.tap()
        
        let eatStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Eat"]/*[[".cells.staticTexts[\"Eat\"]",".staticTexts[\"Eat\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eatStaticText.swipeRight()
        
        let deleteButton = tablesQuery.buttons["Delete"]
        deleteButton.swipeRight()
        deleteButton.swipeRight()
        eatStaticText.swipeRight()
        eatStaticText.swipeRight()
        doneButton.tap()
        homeworkStaticText.swipeRight()
        doneButton.tap()
        
        
    }

}
