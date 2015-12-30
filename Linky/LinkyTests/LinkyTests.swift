//
//  LinkyTests.swift
//  LinkyTests
//
//  Created by Jaden Geller on 12/30/15.
//  Copyright © 2015 Jaden Geller. All rights reserved.
//

import XCTest
@testable import Linky

class LinkyTests: XCTestCase {
    
    func testValueSemantics() {
        var x: LinkedList = [1, 2, 3, 4]
        var z = x
        
        z[2] = 100
        x[0] = 5
        
        XCTAssertTrue([5, 2, 3, 4] as LinkedList == x)
        XCTAssertTrue([1, 2, 100, 4] as LinkedList == z)
    }
    
    func testIndexing() {
        let x: LinkedList = [1, 2, 3, 4]

        XCTAssertEqual(x[0], 1)
        XCTAssertEqual(x[1], 2)
        XCTAssertEqual(x[2], 3)
        XCTAssertEqual(x[3], 4)
    }
}
