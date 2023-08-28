//
//  CurrencyListPresenter.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import Foundation
import UIKit

//MARK: - Protocols
protocol CurrencyListPresenterInput {
    
    var coins: [CurrencyListEntity] { get }
    
    func configureTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
    func managerCell(indexPath: IndexPath)
}

protocol CurrencyListPresenterOutput: AnyObject {
    
    
    
}

//MARK: - Presenter Class
class CurrencyListPresenter: CurrencyListPresenterInput {
    var router: CurrencyListRouterInput
    var interactor: CurrencyListInteractorInput
    
    //
    weak var output: CurrencyListPresenterOutput?
    
    var coins: [CurrencyListEntity]
    
    //INIT
    init(router: CurrencyListRouterInput, interactor: CurrencyListInteractorInput, coins: [CurrencyListEntity]) {
        self.router = router
        self.interactor = interactor
        self.coins = coins
    }
    
    
    func configureTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyListCell.identifer, for: indexPath) as? CurrencyListCell else {
            return UITableViewCell()
            
        }
        
        cell.backgroundColor = .white.withAlphaComponent(0.1)
        cell.configure(withCoin: coins[indexPath.section])
        return cell
    }
    
    
    func managerCell(indexPath: IndexPath) {
        let coinTapped = coins[indexPath.section]
        router.goToDetailCurrency(coin: coinTapped)
    }
    
}
