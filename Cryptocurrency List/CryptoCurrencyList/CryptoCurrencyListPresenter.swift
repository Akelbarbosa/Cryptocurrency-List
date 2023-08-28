//
//  CryptoCurrencyListPresenter.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 26/08/23.
//

import Foundation

//MARK: - Protocol
protocol CryptoCurrencyListPresenterInput {
    func goToCurrencyList()
}


protocol CryptoCurrencyListPresenterOutput: AnyObject {
    
    
}

//MARK: - Presenter Class
class CryptoCurrencyListPresenter: CryptoCurrencyListPresenterInput {
    //
    var router: CryptoCurrencyListRouterInput
    var interactor: CryptoCurrencyListInteractorInput
    
    //INIT
    init(router: CryptoCurrencyListRouterInput, interactor: CryptoCurrencyListInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    ///output
    weak var output: CryptoCurrencyListPresenterOutput?
    
    
    func goToCurrencyList() {
        router.goToCurrencyList(coins: interactor.coins)
    }
    
    
}


//MARK: - Interactor Output
extension CryptoCurrencyListPresenter: CryptoCurrencyListInteractorOutput {}

