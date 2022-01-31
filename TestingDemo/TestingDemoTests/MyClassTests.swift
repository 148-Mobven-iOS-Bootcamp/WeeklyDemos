//
//  MyClassTests.swift
//  TestingDemoTests
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import XCTest
@testable import TestingDemo

class MyClassTests: XCTestCase {

    //System Under Test
    var sut: MyClass!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MyClass()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testMyClass_isNumeric_returnsTrue() throws {
        //Arrange
        sut.stringVariable = "11"

        //Act
        let result = sut.isNumeric()

        //Assert
        XCTAssertEqual(result, true)
    }

    func testMyClass_isNumeric_returnsFalse() throws {
        //Arrange
        sut.stringVariable = "abc"

        //Act
        let result = sut.isNumeric()

        //Assert
        XCTAssertEqual(result, false)
    }
}
