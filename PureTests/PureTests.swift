//
//  PureTests.swift
//  PureTests
//
//  Created by yoshiyuki ono on 2019/03/23.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import XCTest
@testable import Pure

class PureTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testLocalizable() {
        print(NSLocalizedString("welcome", comment: "No such text."))
        print(NSLocalizedString("The following is a list of test programs.", comment: ""))
        print("The following is a list of test programs.".localized)
    }

}
