//
//  MapViewControllerTests.swift
//  ARKITTestTests
//
//  Created by Nafisa Rahman on 12/21/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import XCTest
@testable import ARKITTest

class MapViewControllerTests: XCTestCase {
    
    var mapViewController : MapViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        mapViewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapViewController.loadView()
        mapViewController.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapViewExists() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(mapViewController.mapView)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
