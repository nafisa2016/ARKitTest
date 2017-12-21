//
//  ARKITTestUITests.swift
//  ARKITTestUITests
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import XCTest
@testable import ARKITTest

class ARKITTestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Hisense Arena").element/*[[".maps.containing(.other, identifier:\"Fawkner Park\").element",".maps.containing(.other, identifier:\"South Yarra Station - Stop 127\").element",".maps.containing(.other, identifier:\"South Yarra\").element",".maps.containing(.other, identifier:\"Melbourne High School\").element",".maps.containing(.other, identifier:\"Entrecôte\").element",".maps.containing(.other, identifier:\"Royal Botanic Gardens Victoria\").element",".maps.containing(.other, identifier:\"Ornamental Lake\").element",".maps.containing(.other, identifier:\"The Precinct Hotel\").element",".maps.containing(.other, identifier:\"AAMI Park\").element",".maps.containing(.other, identifier:\"Hisense Arena\").element"],[[[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.navigationBars["ARKITTest.MapView"].buttons["ARView"].tap()
        app.navigationBars["ARKITTest.ARView"].buttons["Back"].tap()
        
        
    }
    
}
