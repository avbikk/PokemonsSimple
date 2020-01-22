//
//  PokemonsPresenterTests.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 21/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import XCTest
@testable import PokemonsVeryImportant

class PokemonsPresenterTests: XCTestCase {

    var presenter: PokemonsPresenter!
    var view: PokemonsInitialDataViewInputMock!
    var interactor: PokemonsInteractorInputMock!
    var router: PokemonsRouterInputMock!

    override func setUp() {
        view = PokemonsInitialDataViewInputMock()
        interactor = PokemonsInteractorInputMock()
        router = PokemonsRouterInputMock()

        presenter = PokemonsPresenter(view: view,
                                      interactor: interactor,
                                      router: router)
    }

    override func tearDown() {
        presenter = nil
        view = nil
        interactor = nil
        router = nil
    }

    func testDownloadPokemonsListWasCalledAfterViewIsReady() {
        // act
        presenter.viewIsReady()
        // assert
        XCTAssert(interactor.downloadPokemonsListCount == 1, "Method DownloadPokemonsList was called after viewIsReady")
    }

    func testShowNextPagePokemonsDataWithEmptyCurrentDataWasCalled() {
        // act
        presenter.showNextPagePokemonsData()
        // assert
        XCTAssert(interactor.downloadPokemonsListCount == 0, "Method DownloadPokemonsList was called after showNextPagePokemonsData with empty current data")
    }
    
    func testShowNextPagePokemonsDataWithCurrentDataWasCalled() {
        // arrange
        let currentData: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        presenter.currentData = currentData
        // act
        presenter.showNextPagePokemonsData()
        // assert
        XCTAssert(interactor.downloadPokemonsListCount == 1, "Method DownloadPokemonsList was called after showNextPagePokemonsData")
    }

    func testPokemonDetailsTappedWasCalled() {
        // act
        presenter.pokemonDetailsTapped(url: "")
        // assert
        XCTAssert(router.openPokemonDetailsViewControllerCount == 1, "Method openPokemonDetailsViewController was called after pokemonDetailsTapped")
    }
    
    func testShowInitialPokemonDataCountWasCalledAfterPokemonsDataDownloadedWasCalled() {
        // arrange
        let data: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        // act
        presenter.pokemonsDataDownloaded(data: data)
        // assert
        XCTAssert(view.showInitialPokemonDataCount == 1, "Method showInitialPokemonDataCount was called after showNextPagePokemonsData")
    }

    func testReloadPokemonsDatadWasCalledAfterPokemonsDataDownloaded() {
        // arrange
        let data: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        let currentData: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        presenter.currentData = currentData
        // act
        presenter.pokemonsDataDownloaded(data: data)
        // assert
        XCTAssert(view.reloadPokemonsDataCount == 1, "Method ReloadPokemonsDataCount was called after showNextPagePokemonsData")
    }
    
    func testShowAlertCountWasCalledAfterPokemonsDataDownloadFailed() {
        // arrange
        let errorMock = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid access token"])
        // act
        presenter.pokemonsDataDownloadFailed(with: errorMock)
        // assert
        XCTAssert(view.showAlertCount == 1, "Method showAlert was called after pokemonsDataDownload Failed")
    }

}
