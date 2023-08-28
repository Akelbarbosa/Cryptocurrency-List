//
//  CryptoCurrencyListRouter.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 26/08/23.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol CryptoCurrencyListRouterInput {
    func createModule() -> UIViewController
    
    func goToCurrencyList(coins: [CurrencyListEntity])
}



//MARK: - Router
class CryptoCurrencyListRouter: CryptoCurrencyListRouterInput {
    weak var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let interactor = CryptoCurrencyListInteractor()
        let presenter = CryptoCurrencyListPresenter(router: self,
                                                    interactor: interactor)
        let view = CryptoCurrencyListView(presenter: presenter)
        viewController = view
        
        return view 
    }
    
    func goToCurrencyList(coins: [CurrencyListEntity]) {
        let currencyListModule = CurrencyListRouter()

        viewController?.navigationController?.pushViewController(currencyListModule.createModule(withCoins: coins),animated: true)
    }
    
}
