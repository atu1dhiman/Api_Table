//
//  NationModel.swift
//  Api_Table
//
//  Created by Atul Dhiman on 29/08/22.
//

import Foundation

//// MARK: - NationModel
//struct NationModel: Codable {
//    let name: String?
//    let country: [Country]?
//}
//
//// MARK: - Country
//struct Country: Codable {
//    let countryID: String?
//    let probability: String?
//}


// MARK: - NationModel
struct NationModel: Codable {
    let name: String?
    let country: [Country]?
}

// MARK: - Country
struct Country: Codable {
    let countryID: String?
    let probability: Double?

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case probability
    }
}
