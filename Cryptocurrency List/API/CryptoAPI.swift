//
//  CoinApiManager.swift
//  Cryptocurrency List
//
//  Created by Akel Barbosa on 27/08/23.
//

import Foundation

class CryptoAPI {
    static let shared = CryptoAPI()
    
    func fetchCryptoData(coinID: String, completion: @escaping ([CryptoInfo]?) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=\(coinID)&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let cryptoInfo = try decoder.decode([CryptoInfo].self, from: data)
                        completion(cryptoInfo)
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(nil)
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                    completion(nil)
                }
            }.resume()
        } else {
            completion(nil)
        }
    }

}


struct CryptoInfo: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let high_24h: Double
    let low_24h: Double

}
