//
//  PokemonDetailsInteractorTests.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import XCTest
@testable import PokemonsVeryImportant


class PokemonDetailsInteractorTests: XCTestCase {

    var interactor: PokemonDetailsInteractor!
    var service: PokemonsServiceProtocolMock!
    
    override func setUp() {
        super.setUp()
        service = PokemonsServiceProtocolMock()
        interactor = PokemonDetailsInteractor(service: service)
    }

    override func tearDown() {
        interactor = nil
        service = nil
        super.tearDown()
}

    func testDownloadPokemonsListWasCalled() {
        // act
        interactor.downloadPokemonDetails(urlPokemonDetails: "Url")

        // assert
        XCTAssert(service.downloadDataCount == 1, "DownloadPokemonsList method was not  called for interactor")
    }
    
    func testDownloadPokemonsListWithEmptyUrlWasCalled() {
        // act
        interactor.downloadPokemonDetails(urlPokemonDetails: "url")

        // assert
        XCTAssert(service.downloadDataCount == 0, "DownloadPokemonsList method was called for interactor with empty url")
    }
}

