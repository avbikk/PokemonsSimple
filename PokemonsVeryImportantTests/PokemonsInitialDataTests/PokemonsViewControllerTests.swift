//
//  PokemonsViewControllerTests.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import XCTest
@testable import PokemonsVeryImportant

class PokemonsViewControllerTests: XCTestCase {

    var viewController: PokemonsInitialDataViewController!
    var output: PokemonsInitialDataViewOutputMock!

    override func setUp() {
        super.setUp()
        viewController = PokemonsInitialDataViewController()
        output = PokemonsInitialDataViewOutputMock()
        viewController.output = output
    }

    override func tearDown() {
        viewController = nil
        output = nil
        super.tearDown()
    }
    
    func testOutputViewIsReadyWasCalled() {
        // act
        viewController.viewDidLoad()
        // assert
        XCTAssertTrue(output.viewIsReadyCount != 0)
    }
}
