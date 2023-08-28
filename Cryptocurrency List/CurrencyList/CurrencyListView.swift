//
//  CurrencyListView.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import UIKit

class CurrencyListView: UIViewController {
    //
    var presenter: CurrencyListPresenterInput
    
    //INIT
    init(presenter: CurrencyListPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Views
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Configure Views
    private func configureViews() {
        
        //Table View
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(CurrencyListCell.self, forCellReuseIdentifier: CurrencyListCell.identifer)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
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
        configureViews()
        
        
    }

}

//MARK: - TableView Delegate
extension CurrencyListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.configureTableViewCell(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.managerCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 5))
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 5))
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
}

//MARK: - Presenter Output
extension CurrencyListView: CurrencyListPresenterOutput {
    
}
