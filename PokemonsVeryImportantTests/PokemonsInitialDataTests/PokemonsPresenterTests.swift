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
        super.setUp()
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
        super.tearDown()
    }
    
    func testDownloadPokemonsListWasCalledAfterViewIsReady() {
        // act
        presenter.viewIsReady()
        // assert
        XCTAssert(interactor.downloadPokemonsListCount == 1, "Method DownloadPokemonsList was not called after viewIsReady")
    }
    
    func testDownloadPokemonsListCountWasNotCalled() {
        // act
        presenter.didShowLastItem()
        // assert
        XCTAssert(interactor.downloadPokemonsListCount == 0, "Method DownloadPokemonsList was not called after didShowLastItem with empty current data")
    }
    
    func testDownloadPokemonsListCountWasCalledAfterDidShowLastItem() {
        // arrange
        let data: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        presenter.pokemonsDataDownloaded(data: data)
        // act
        presenter.didShowLastItem()
        // assert
        XCTAssertEqual(interactor.downloadPokemonsListCount, 1, "Method DownloadPokemonsList was not called after didShowLastItem")
    }
    
    func testOpenPokemonDetailsViewControllerCountAfterPokemonDetailsTappedWasCalled() {
        // act
        presenter.pokemonDetailsTapped(with: "")
        // assert
        XCTAssertEqual(router.openPokemonDetailsViewControllerCount, 1, "Method openPokemonDetailsViewController was not called after pokemonDetailsTapped")
    }
    
    func testShowInitialPokemonDataCountWasCalledAfterPokemonsDataDownloadedWasCalled() {
        // arrange
        let data: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        // act
        presenter.pokemonsDataDownloaded(data: data)
        // assert
        XCTAssertEqual(view.showInitialPokemonDataCount, 1, "Method showInitialPokemonDataCount was not called after showNextPagePokemonsData")
        XCTAssertEqual(view.reloadPokemonsDataCount, 0, "Method ReloadPokemonsData was called after pokemonsDataDownloaded")
    }
    
    func testReloadPokemonsDataWasCalledAfterPokemonsDataDownloaded() {
        // arrange
        let data: PokemonsData? = PokemonsData(count: 1, next: "", previous: "", results: [])
        presenter.pokemonsDataDownloaded(data: data)
        // act
        presenter.pokemonsDataDownloaded(data: data)
        // assert
        XCTAssertEqual(view.reloadPokemonsDataCount, 1, "Method ReloadPokemonsData was not called after pokemonsDataDownloaded when currentData for presenter wasn't empty")
        
    }
    
    func testShowAlertCountWasCalledAfterPokemonsDataDownloadFailed() {
        // arrange
        let errorMock = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid access token"])
        // act
        presenter.pokemonsDataDownloadFailed(with: errorMock)
        // assert
        XCTAssertEqual(view.showAlertCount, 1, "Method showAlert was not called after pokemonsDataDownload Failed")
    }
    
}
