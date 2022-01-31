//
//  ViewControllerTests.swift
//  TestingDemoTests
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import XCTest
@testable import TestingDemo

class ViewControllerTests: XCTestCase {

    var sut: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testViewController_countLabelInitialValue_shouldBeZero() throws {
        XCTAssertEqual(sut.countLabel.text, "0")
    }

    func testViewController_whenTappedPlusButton_countLabelShowsTappedCount() throws {
        sut.plusButton.sendActions(for: .touchUpInside)
        sut.plusButton.sendActions(for: .touchUpInside)
        sut.plusButton.sendActions(for: .touchUpInside)
        sut.plusButton.sendActions(for: .touchUpInside)

        XCTAssertEqual(sut.countLabel.text, "4")
    }
}


//real data -> db
//fake data -> Ahmet Mahmutoglu 05445448988899
//dummy data -> asfdfasdas dfgsdfwa 123532424
//stub data -> getName() -> "Ahmet"
//mock -> komple class ya da benzer karmasik yapilari amaca uygun taklit etme
