//
//  UnitTestAppExampleTests.swift
//  UnitTestAppExampleTests
//
//  Created by sanchit on 26/03/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import XCTest
@testable import UnitTestAppExample

class UnitTestAppExampleTests: XCTestCase {

    func testSquare(){
       XCTAssertEqual(squareNum(num: 3), 9, "testing")
    }
    func testControllerFunction(){
        let newObj = ViewController()
        XCTAssertEqual(newObj.checkSquare(num: 3), 9)
    }
}
