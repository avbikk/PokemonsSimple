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
        super.setUp()
        service = PokemonsServiceProtocolMock()
        interactor = PokemonsInteractor(service: service)
    }

    override func tearDown() {
        interactor = nil
        service = nil
        super.tearDown()
    }

    func testDownloadDataWasCalledAfterDownloadPokemonsListWasCalled() {
        // act
        interactor.downloadPokemonsList(url: "Url")

        // assert
        XCTAssert(service?.downloadDataCount == 1, "DownloadPokemonsList method was not called for interactor")
    }
    
    func testDownloadDataWasNotCalledAfterDownloadPokemonsListWasCalledWithEmptyUrl() {
        // act
        interactor.downloadPokemonsList(url: "url")

        // assert
        XCTAssert(service?.downloadDataCount == 0, "DownloadPokemonsList method was not called for interactor with empty url")
    }
}
