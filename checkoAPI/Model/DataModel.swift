//
//  DataModel.swift
//  checkoAPI
//
//  Created by Bair Nadtsalov on 13.11.2022.
//

import Foundation

struct DataModel: Decodable {
    
    let ОГРН: String
    let ИНН: String
    let КПП: String
    let ДатаРег: String
    let НаимСокр: String
    let НаимПолн: String
    let Статус: StatusModel
    let Регион: RegionModel
    let ЮрАдрес: AdressModel
    let ОКВЭД: OKVEDModel
    let УстКап: CapModel
    let Руковод: [ManagerModel]
    let Контакты: ContactsModel?
}
