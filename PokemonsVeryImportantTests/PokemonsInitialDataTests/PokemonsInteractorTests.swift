//
//  PokemonsVeryImportantTests.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 17/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import XCTest
@testable import PokemonsVeryImportant

class PokemonsInteractorTests: XCTestCase {

    var interactor: PokemonsInteractor!
    var service: PokemonsServiceProtocolMock!
    
    override func setUp() {
        service = PokemonsServiceProtocolMock()
        interactor = PokemonsInteractor(service: service)
    }

    override func tearDown() {
        interactor = nil
        service = nil
    }

    func testDownloadPokemonsListWasCalled() {
        // act
        interactor.downloadPokemonsList(url: "Url")

        // assert
        XCTAssert(service?.downloadDataCount == 1, "DownloadPokemonsList method was called for interactor")
    }
    
    func testDownloadPokemonsListWithEmptyUrlWasCalled() {
        // act
        interactor.downloadPokemonsList(url: nil)

        // assert
        XCTAssert(service?.downloadDataCount == 0, "DownloadPokemonsList method was called for interactor with empty url")
    }
}
