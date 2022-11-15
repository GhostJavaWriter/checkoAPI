//
//  NetworkManager.swift
//  checkoAPI
//
//  Created by Bair Nadtsalov on 14.11.2022.
//

import Foundation

enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

class NetworkManager {
    
    func fetchResult<T: Decodable>(with inn: String, completion: @escaping (T?) -> Void) {
        
        let mainUrl = "https://api.checko.ru/v2/company?key="
        let apiKey = "UF8CZDgBwGR2fx13"
        let urlString = mainUrl + apiKey + "&inn=" + inn
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            
            let result = self?.decodeJSON(type: T.self, data: data)
            completion(result)
        }
        dataTask.resume()
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        
        guard let data = data else { return nil}
        
        do {
            let jsonData = try JSONDecoder().decode(type.self, from: data)
            return jsonData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
