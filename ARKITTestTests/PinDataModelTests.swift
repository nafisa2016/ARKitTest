//
//  PinDataModelTests.swift
//  ARKITTestTests
//
//  Created by Nafisa Rahman on 12/20/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import XCTest
@testable import ARKITTest
import MapKit

class PinDataModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPinDataModel() {
        
        let myPinDataModel = PinDataModel(title: "pin", coordinate: CLLocationCoordinate2D(latitude: -37.837529417944396, longitude: 144.984269057738))
        
        XCTAssertNotNil(myPinDataModel)
        
        XCTAssertEqual(myPinDataModel.title, "pin", "Titles are not equal")
        
        XCTAssertEqual(myPinDataModel.coordinate.latitude,  CLLocationCoordinate2D(latitude: -37.837529417944396, longitude: 144.984269057738).latitude, "latitudes are not equal")
        
        XCTAssertEqual(myPinDataModel.coordinate.longitude,  CLLocationCoordinate2D(latitude: -37.837529417944396, longitude: 144.984269057738).longitude, "longitudes are not equal")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
