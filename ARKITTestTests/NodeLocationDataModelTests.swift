//
//  NodeLocationDataModelTests.swift
//  ARKITTestTests
//
//  Created by Nafisa Rahman on 12/21/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import XCTest
@testable import ARKITTest
import ARKit

class NodeLocationDataModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNodeLocationModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let nodeLocationModel = NodeLocationDataModel(position: SCNVector3(1,2,-10))
        
        if let position = nodeLocationModel.position {
            XCTAssertEqual(position.x,1 , "Positions don't match")
            XCTAssertEqual(position.y,2 , "Positions don't match")
            XCTAssertEqual(position.z,-10 , "Positions don't match")
            
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
