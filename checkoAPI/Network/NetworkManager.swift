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
    
    func fetchResult<T: Decodable>(with inn: String, completion: @escaping (T?, Error?) -> Void) {
        
        let mainUrl = "https://api.checko.ru/v2/company?key="
        let apiKey = "UF8CZDgBwGR2fx13"
        let urlString = mainUrl + apiKey + "&inn=" + inn
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            
            if error != nil {
                completion(nil, error)
                return
            }
            
            let result = self?.decodeJSON(type: T.self, data: data)
            completion(result, nil)
        }
        dataTask.resume()
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        
        guard let data = data else {
            print("data nil")
            return nil
        }
        
        do {
            let jsonData = try JSONDecoder().decode(type.self, from: data)
            return jsonData
        } catch {
            print("json decoding error")
            print(error.localizedDescription)
            return nil
        }
    }
}
