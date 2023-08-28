//
//  CurrencyDetailView.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import UIKit
import SDWebImage


class CurrencyDetailView: UIViewController {

    var presenter: CurrencyDetailPresenterInput
    
    //INIT
    init(presenter: CurrencyDetailPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Views
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let currentPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let high24Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let low24Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    //MARK: - configure Views
    private func configureView() {
        //Image
        view.addSubview(iconImage)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            iconImage.widthAnchor.constraint(equalToConstant: 100),
        ])
        iconImage.layoutIfNeeded()
        iconImage.layer.cornerRadius = 50
        iconImage.layer.masksToBounds = true
        
        
        //Name
        view.addSubview(nameLabel)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
        nameLabel.textColor = .white
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        //Container
        view.addSubview(containerStackView)
        containerStackView.axis = .vertical
        //containerStackView.spacing = 40
        containerStackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            containerStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        
        ])
        
        //Symbol
        containerStackView.addArrangedSubview(symbolLabel)
        symbolLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        symbolLabel.textColor = .white
        symbolLabel.textAlignment = .left
        
        //Price
        containerStackView.addArrangedSubview(currentPrice)
        currentPrice.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        currentPrice.textColor = .white
        currentPrice.textAlignment = .left
        
        //high 24
        containerStackView.addArrangedSubview(high24Label)
        high24Label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        high24Label.textColor = .white
        high24Label.textAlignment = .left


        //low 24
        containerStackView.addArrangedSubview(low24Label)
        low24Label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        low24Label.textColor = .white
        low24Label.textAlignment = .left
        
        containerStackView.addArrangedSubview(UIView())
    
    }
    
    //MARK: - Configure ViewController
    private func configureViewController() {
        view.backgroundColor = .darkGray
    }
    
    
    //MARK: - Life Cycle
    deinit {
        debugPrint("\(self) dealloc")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController() 
        configureView()
        presenter.viewDidLoad()
    }


}

//MARK: - Presenter Output
extension CurrencyDetailView: CurrencyDetailPresenterOutput {
    func coinData(data: CryptoInfo) {
        DispatchQueue.main.async { [weak self] in
            self?.iconImage.sd_setImage(with: URL(string: data.image))
            
            self?.nameLabel.text = "Name: \(data.name)".uppercased()
            self?.currentPrice.text = "Current Price:  \(data.current_price) USD".uppercased()
            self?.symbolLabel.text = "Symbol:  \(data.symbol)".uppercased()
            self?.high24Label.text = "High 24h:   \(data.high_24h) USD".uppercased()
            self?.low24Label.text = "Low 24h:  \(data.low_24h) USD".uppercased()
        }
        
        
    }
    
    
}
