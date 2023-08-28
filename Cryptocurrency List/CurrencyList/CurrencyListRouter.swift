//
//  CurrencyListRouter.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol CurrencyListRouterInput {
    
    func createModule(withCoins coins: [CurrencyListEntity]) -> UIViewController
    
    func goToDetailCurrency(coin: CurrencyListEntity)
}


//MARK: - Router Class
class CurrencyListRouter: CurrencyListRouterInput {
    weak var viewController: UIViewController?
    
    func createModule(withCoins coins: [CurrencyListEntity]) -> UIViewController {
        
        let interactor = CurrencyListInteractor()
        let presenter = CurrencyListPresenter(router: self,
                                              interactor: interactor,
                                              coins: coins)
        let view = CurrencyListView(presenter: presenter)
        viewController = view
        
        return view
    }
    
    func goToDetailCurrency(coin: CurrencyListEntity) {
        let currencyDetail = CurrencyDetailRouter()
        viewController?.navigationController?.pushViewController(currencyDetail.createModule(withCoin: coin), animated: true)
    }

}
