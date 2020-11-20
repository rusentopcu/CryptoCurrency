//
//  Webservice.swift
//  CryptoCurrencyApp
//
//  Created by Rusen Topcu on 20.11.2020.
//

import Foundation


class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                
               let cryptoList = try?  JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                
                if let cryptolist = cryptoList {
                    completion(cryptolist)
                }
                
            }
        }.resume()
        
    }
    
}
