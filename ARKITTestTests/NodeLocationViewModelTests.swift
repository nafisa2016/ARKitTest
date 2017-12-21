//
//  NodeLocationViewModelTests.swift
//  ARKITTestTests
//
//  Created by Nafisa Rahman on 12/21/17.
//  Copyright © 2017 com.nafisa. All rights reserved.
//

import XCTest
import ARKit
@testable import ARKITTest

class NodeLocationViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNodeLocation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let newNodeViewModel = NodeLocationViewModel()
        newNodeViewModel.nodeLocations.append(NodeLocationDataModel(position: SCNVector3(0,1,-3)))
        
        XCTAssertEqual(newNodeViewModel.nodeLocations.count, 1, "count not matching")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
