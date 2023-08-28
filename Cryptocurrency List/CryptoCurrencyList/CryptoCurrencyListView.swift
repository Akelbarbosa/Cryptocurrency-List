//
//  CryptoCurrencyListView.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 26/08/23.
//

import UIKit

class CryptoCurrencyListView: UIViewController {
    var presenter: CryptoCurrencyListPresenterInput
    
    //INIT
    init(presenter: CryptoCurrencyListPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionOneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTwoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let generateNewWalletButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let orCaptureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accessWalletButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let buttonsContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleContainerView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let contentContainerView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Configure Views
    private func configureViews() {
        
        //
        view.addSubview(titleContainerView)

        NSLayoutConstraint.activate([
            titleContainerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            titleContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        
        // Title
        titleContainerView.addSubview(titleLabel)
        titleLabel.text = "Welcome to CryptoWallet!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
        ])
        
        
        // Container
        view.addSubview(contentContainerView)
       
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: 50),
            contentContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -10),
            contentContainerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        
        contentContainerView.addSubview(containerStackView)
        containerStackView.axis = .vertical
        containerStackView.spacing = 50

        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor),
        ])


        //description 1
        containerStackView.addArrangedSubview(descriptionOneLabel)
        
        descriptionOneLabel.text = "If you are creating a new wallet press the GENERATE button. Take note of the mnemonic phrase, it should be stored in a safe place."
        descriptionOneLabel.textColor = .white.withAlphaComponent(0.7)
        descriptionOneLabel.numberOfLines = 0
    
        
        //description 2
        containerStackView.addArrangedSubview(descriptionTwoLabel)
        
        descriptionTwoLabel.text = "address list elephant genuine thunder conduct avocado educate chronic useless basic rough notable noble water bless labor monster muscle bike view caution river flavor"
        descriptionTwoLabel.numberOfLines = 0
        descriptionTwoLabel.textColor = .white
        //
        
        
        // button container
        containerStackView.addArrangedSubview(buttonsContainerStackView)
        
        buttonsContainerStackView.axis = .vertical
        
        // Button
        buttonsContainerStackView.addArrangedSubview(generateNewWalletButton)
        
        generateNewWalletButton.setTitle("GENERATE NEW WALLET", for: .normal)
        generateNewWalletButton.setTitleColor(.white, for: .normal)
        generateNewWalletButton.backgroundColor = .lightGray.withAlphaComponent(0.7)
        generateNewWalletButton.layer.cornerRadius = 10
        generateNewWalletButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Button OR CAPTURE
        buttonsContainerStackView.addArrangedSubview(orCaptureButton)
        
        orCaptureButton.setTitle("OR CAPTURE", for: .normal)
        orCaptureButton.backgroundColor = .clear
        orCaptureButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //Spacing
        containerStackView.addArrangedSubview(UIView())


        //Button ACCESS WALLET
        containerStackView.addArrangedSubview(accessWalletButton)
        
        accessWalletButton.backgroundColor = .systemBlue
        accessWalletButton.setTitle("ACCESS WALLET", for: .normal)
        accessWalletButton.layer.cornerRadius = 10
        accessWalletButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        accessWalletButton.addTarget(self, action: #selector(accessWalletButtonAction), for: .touchUpInside)
        
        //Spacing
        containerStackView.addArrangedSubview(UIView())
    }
    
    //MARK: - Configure ViewController
    private func configureViewController() {
        view.backgroundColor = .darkGray

    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureViews()
    }
    
    //MARK: - Actions
    @objc func accessWalletButtonAction() {
        presenter.goToCurrencyList()
    }
}


//MARK: - Presenter Output
extension CryptoCurrencyListView: CryptoCurrencyListPresenterOutput {
    
}
