//
//  CurrencyDetailRouter.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import Foundation
import UIKit


//MARK: - Protocols
protocol CurrencyDetailRouterInput {
    func createModule(withCoin coin: CurrencyListEntity) -> UIViewController
    
    
}

//MARK: - Router Class
class CurrencyDetailRouter: CurrencyDetailRouterInput {
    
    
    func createModule(withCoin coin: CurrencyListEntity) -> UIViewController {
        let interactor = CurrencyDetailInteractor(coinApi: CryptoAPI.shared)
        let presenter = CurrencyDetailPresenter(router: self,
                                                interactor: interactor,
                                                coin: coin)
        let view = CurrencyDetailView(presenter: presenter)
        
        interactor.output = presenter
        presenter.output = view
        
        return view
    }
}



