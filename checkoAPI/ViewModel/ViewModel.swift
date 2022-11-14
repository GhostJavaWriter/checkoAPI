//
//  ViewModel.swift
//  checkoAPI
//
//  Created by Bair Nadtsalov on 13.11.2022.
//

import Foundation

class ViewModel {
    
    private var networkManager = NetworkManager()
    private var result: ResultData?
    
    func fetchResult(with inn: String, completion: @escaping () -> Void) {
        networkManager.fetchResult(with: inn, completion: { [weak self] result in
            self?.result = result
            completion()
        })
    }
    
    func getCompanyName() -> String {
        guard let result = result else { return "<<error>>"}
        return result.data.НаимСокр
    }
}
