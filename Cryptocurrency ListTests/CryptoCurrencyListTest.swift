//
//  CryptoCurrencyListTest.swift
//  Cryptocurrency ListTests
//
//  Created by Akel Barbosa on 28/08/23.
//

import XCTest

@testable import Cryptocurrency_List
import SDWebImage

class CryptoCurrencyListPresenterTests: XCTestCase {

    // Esta es una clase ficticia que simula el router y el interactor.
    // Puedes crear una clase de prueba o utilizar bibliotecas de doble para simular estas dependencias.
    class MockRouter: CryptoCurrencyListRouterInput {
        var goToCurrencyListCalled = false
        
        func goToCurrencyList(coins: [CryptoCurrency]) {
            goToCurrencyListCalled = true
        }
    }
    
    class MockInteractor: CryptoCurrencyListInteractorInput {
        var coins: [CryptoCurrency] = []
    }

    var presenter: CryptoCurrencyListPresenter!
    var mockRouter: MockRouter!
    var mockInteractor: MockInteractor!

    override func setUp() {
        super.setUp()
        mockRouter = MockRouter()
        mockInteractor = MockInteractor()
        presenter = CryptoCurrencyListPresenter(router: mockRouter, interactor: mockInteractor)
        presenter.output = nil // Esto es opcional, depende de tu implementación real.
    }

    override func tearDown() {
        presenter = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testGoToCurrencyList() {
        // Verifica que al llamar a goToCurrencyList, el router se llame correctamente.
        presenter.goToCurrencyList()
        XCTAssertTrue(mockRouter.goToCurrencyListCalled)
    }

    // Agrega más pruebas según tus necesidades

}


