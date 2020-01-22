//
//  PokemonDetailsViewControllerTests.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import XCTest
@testable import PokemonsVeryImportant

class PokemonDetailsViewControllerTests: XCTestCase {

    var viewController: PokemonDetailsViewController!
    var output: PokemonDetailsViewOutputMock!
        
    override func setUp() {
        viewController = PokemonDetailsViewController()
        output = PokemonDetailsViewOutputMock()
        viewController.output = output
    }

    override func tearDown() {
        viewController = nil
    }

    func testOutputViewIsReadyWasCalled() {
        // act
        viewController.viewDidLoad()
        // assert
        XCTAssertTrue(output.viewIsReadyCount != 0)
    }
}
