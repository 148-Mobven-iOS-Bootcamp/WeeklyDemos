//
//  Double+Tests.swift
//  TestingDemoTests
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import XCTest
@testable import TestingDemo

class DoubleExtensionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDoubleExtensions_kelvinToCelcius_equalsToZero() throws {
        //Arrange: initial values
        let kelvin: Double = 273.0
        //Act: olacak islem
        let result = kelvin.kelvinToCelcius()
        //Assert: sonuc
        XCTAssertEqual(result, 0.0)
    }

    func testDoubleExtension_kelvinToCelcius_notEqualsToZero() throws {
        //Arrange: initial values
        let kelvin: Double = 27.0
        //Act: olacak islem
        let result = kelvin.kelvinToCelcius()
        //Assert: sonuc
        XCTAssertNotEqual(result, 0.0, "Celcius should not equal to zero")
    }
}
