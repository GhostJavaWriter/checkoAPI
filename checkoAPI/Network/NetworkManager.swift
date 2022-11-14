//
//  NetworkManager.swift
//  checkoAPI
//
//  Created by Bair Nadtsalov on 14.11.2022.
//

import Foundation

class NetworkManager {
    
    func fetchResult(with inn: String, completion: @escaping (ResultData) -> Void) {
        
        let mainUrl = "https://api.checko.ru/v2/company?key="
        let apiKey = "UF8CZDgBwGR2fx13"
        let urlString = mainUrl + apiKey + "&inn=" + inn
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            let decoder = JSONDecoder()
            
            do {
                let jsonData = try decoder.decode(ResultData.self, from: data)
                completion(jsonData)
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
