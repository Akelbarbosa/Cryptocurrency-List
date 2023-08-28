//
//  CryptoCurrencyListInteractor.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 26/08/23.
//

import Foundation

//MARK: - Protocol
protocol CryptoCurrencyListInteractorInput {
    var coins: [CurrencyListEntity] { get }
}


protocol CryptoCurrencyListInteractorOutput: AnyObject {

}


//MARK: - Interactor Class
class CryptoCurrencyListInteractor: CryptoCurrencyListInteractorInput {
    
    ///output
    weak var output: CryptoCurrencyListInteractorOutput?
    
    var coins: [CurrencyListEntity] = [
        CurrencyListEntity(coin: "BITCOIN",
                           coinID: "bitcoin",
                           symbol: "BTC",
                           price: 324,
                           percentage: 23),

        CurrencyListEntity(coin: "QUANT",
                           coinID: "quant-network",
                           symbol: "QNT",
                           price: 324,
                           percentage: 23),
        
        CurrencyListEntity(coin: "XCAD Network",
                           coinID: "xcad-network",
                           symbol: "XCAD",
                           price: 324,
                           percentage: 23),
        
        CurrencyListEntity(coin: "ETHEREUM",
                           coinID: "ethereum",
                           symbol: "ETH",
                           price: 324,
                           percentage: 23),
        
        CurrencyListEntity(coin: "BNB",
                           coinID: "binancecoin",
                           symbol: "BNB",
                           price: 324,
                           percentage: 23),
    ]
}


