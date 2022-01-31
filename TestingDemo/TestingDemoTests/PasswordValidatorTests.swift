//
//  PasswordValidatorTests.swift
//  TestingDemoTests
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import XCTest
@testable import TestingDemo

class PasswordValidatorTests: XCTestCase {

    var sut: PasswordValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PasswordValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testPasswordValidator_whenPasswordValid_validateReturnsTrue() throws {
        //Arrange
        let password = "123456789"

        //Act
        let result = sut.validate(password)

        //Assert
        XCTAssertTrue(result)
    }

    func testPasswordValidator_whenPasswordInvalid_validateReturnsFalse() throws {
        //Arrange
        let password = ""

        //Act
        let result = sut.validate(password)

        //Assert
        XCTAssertFalse(result)
    }

    func testPasswordValidator_whenPasswordTooShort_validateReturnsFalse() throws {
        //Arrange
        let password = "123"

        //Act
        let result = sut.validate(password)

        //Assert
        XCTAssertFalse(result, "Password is too short, password text should has least \(sut.passwordCountLowerBound) character")
    }

    func testPasswordValidator_whenPasswordTooLong_validateReturnsFalse() throws {
        //Arrange
        let password = "12345678901234"

        //Act
        let result = sut.validate(password)

        //Assert
        XCTAssertFalse(result, "Password is too short, password text should has above \(sut.passwordCountUpperBound) character")
    }
}
