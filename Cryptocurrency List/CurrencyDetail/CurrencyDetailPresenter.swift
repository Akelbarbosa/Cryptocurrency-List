//
//  CurrencyDetailPresenter.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import Foundation

//MARK: - Protocols
protocol CurrencyDetailPresenterInput {
    func viewDidLoad()
}

protocol CurrencyDetailPresenterOutput: AnyObject {
    func coinData(data: CryptoInfo)
}

//MARK: - Interactor Class
class CurrencyDetailPresenter: CurrencyDetailPresenterInput {
    var router: CurrencyDetailRouterInput
    var interactor: CurrencyDetailInteractorInput
    var coin: CurrencyListEntity
    
    
    //
    weak var output: CurrencyDetailPresenterOutput?
    
    init(router: CurrencyDetailRouterInput, interactor: CurrencyDetailInteractorInput, coin: CurrencyListEntity) {
        self.router = router
        self.interactor = interactor
        self.coin = coin
    }
    
    func viewDidLoad() {
        interactor.fetchCoinData(coinID: coin.coinID)
    }
}

//MARK: - Interactor Output
extension CurrencyDetailPresenter: CurrencyDetailInteractorOuput {
    func coinData(data: CryptoInfo) {
        output?.coinData(data: data)
    }
    
    
}
