//
//  PokemonDetailsPresenterTests.swift
//  PokemonsVeryImportantTests
//
//  Created by Alsu Bikkulova on 22/01/2020.
//  Copyright © 2020 Alsu Bikkulova. All rights reserved.
//

import XCTest
@testable import PokemonsVeryImportant

class PokemonDetailsPresenterTests: XCTestCase {

    var presenter: PokemonDetailsPresenter!
    var view: PokemonDetailsViewInputMock!
    var interactor: PokemonDetailsInteractorInputMock!

    override func setUp() {
        super.setUp()
        view = PokemonDetailsViewInputMock()
        interactor = PokemonDetailsInteractorInputMock()
        presenter = PokemonDetailsPresenter(view: view,
                                            interactor: interactor,
                                            url: "url")
    }

    override func tearDown() {
        view = nil
        interactor = nil
        presenter = nil
        super.tearDown()
}

    func testDownloadPokemonDetailsWasCalledAfterViewIsReady() {
        // act
        presenter.viewIsReady()
        // assert
        XCTAssert(interactor.downloadPokemonDetailsCount == 1, "DownloadPokemonDetails was not called after viewIsReady")
    }
    
    func testShowPokemonDetailsWasCalledAfterPokemonsDetailsDownloaded() {
        // arrange
        let data: PokemonDetails = PokemonDetails(effectChanges: [], effectEntries: [], flavorTextEntries: [], generation: Generation(name: "", url: ""), id: 1, isMainSeries: false, name: "", names: [], pokemon: [])
        // act
        presenter.pokemonsDetailsDownloaded(data: data)
        // assert
        XCTAssert(view.showPokemonDetailsCount == 1, "ShowPokemonDetails was not called after pokemonsDetailsDownloaded")
    }
    
    func testShowAlertWasCalledAfterPokemonsDetailsDownloadFailed() {
        // arrange
        let errorMock = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid access token"])
        // act
        presenter.pokemonsDetailsDownloadFailed(with: errorMock)
        // assert
        XCTAssert(view.showAlertCount == 1, "ShowPokemonDetails was not called after pokemonsDetailsDownloadFailed")
    }

}
