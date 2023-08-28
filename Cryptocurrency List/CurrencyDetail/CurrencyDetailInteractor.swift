//
//  CurrencyDetailInteractor.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import Foundation

//MARK: - Protocols
protocol CurrencyDetailInteractorInput {
    func fetchCoinData(coinID: String) 
}

protocol CurrencyDetailInteractorOuput: AnyObject {
    
    func coinData(data: CryptoInfo)
}

//MARK: - Interactor Class
class CurrencyDetailInteractor: CurrencyDetailInteractorInput {
    var coinApi: CryptoAPI
    
    //
    weak var output: CurrencyDetailInteractorOuput?
    
    init(coinApi: CryptoAPI) {
        self.coinApi = coinApi
    }
    
    
    func fetchCoinData(coinID: String) {
        coinApi.fetchCryptoData(coinID: coinID) {[weak self] result in
            guard let result = result, let coinData = result.first else  { return }
            self?.output?.coinData(data: coinData)
        }
    }
    
}

