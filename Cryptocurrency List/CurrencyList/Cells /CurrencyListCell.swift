//
//  CurrencyListCell.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import UIKit

class CurrencyListCell: UITableViewCell {
    static let identifer = "CurrencyListCell"
    
    
    //MARK: - Views
    private let coinTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let namesStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pricesStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    //MARK: - Configure Views
    private func configureViews() {
        
        //Stack
        contentView.addSubview(contentStackView)
        contentStackView.axis = .horizontal
        contentStackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        contentStackView.isLayoutMarginsRelativeArrangement = true
        contentStackView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        //Stack Views Names
        contentStackView.addArrangedSubview(namesStackView)
        namesStackView.axis = .vertical
        
        
        //Name
        namesStackView.addArrangedSubview(coinTitleLabel)
        
        coinTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        coinTitleLabel.textColor = .white
        
    
        //Symbol
        namesStackView.addArrangedSubview(symbolLabel)

        symbolLabel.font = UIFont.systemFont(ofSize: 17)
        symbolLabel.textColor = .white
        
        //Stack Price
        contentStackView.addArrangedSubview(pricesStackView)
        pricesStackView.axis = .vertical
    
        
        //price
        pricesStackView.addArrangedSubview(priceLabel)
        priceLabel.textColor = .white.withAlphaComponent(0.7)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        //percentaje
        pricesStackView.addArrangedSubview(percentageLabel)
        percentageLabel.textColor = .red.withAlphaComponent(0.7)
        percentageLabel.font = UIFont.systemFont(ofSize: 17)
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()

        contentStackView.layer.cornerRadius = 10
        

    }
    
    //Configure Cell
    func configure(withCoin coin: CurrencyListEntity) {
        coinTitleLabel.text = coin.coin
        symbolLabel.text = coin.symbol
        priceLabel.text = "$\(coin.price)"
        percentageLabel.text = "\(coin.percentage) %"
    }
    
}
