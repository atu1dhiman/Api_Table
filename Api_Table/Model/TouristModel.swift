//
//  TouristModel.swift
//  Api_Table
//
//  Created by Atul Dhiman on 29/08/22.
//

import Foundation

//struct TouristModel: Codable {
//    let page, perPage, totalrecord, totalPages: Int?
//    let data: [Datum]?
//}
//
//
//struct Datum: Codable {
//    let id: Int?
//    let touristName: String?
//
//}


struct TouristModel: Codable {
    let page, perPage, totalrecord, totalPages: Int
    let data: [Datum]?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalrecord
        case totalPages = "total_pages"
        case data
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let touristName: String
    let touristEmail: String
    let touristLocation: TouristLocation
    let createdat: String

    enum CodingKeys: String, CodingKey {
        case id
        case touristName = "tourist_name"
        case touristEmail = "tourist_email"
        case touristLocation = "tourist_location"
        case createdat
    }
}

enum TouristLocation: String, Codable {
    case pampanga = "Pampanga"
    case usa = "USA"
}

//enum TouristName: String, Codable {
//    case huhu = "Huhu"
//    case kenkenkenken = "kenkenkenken"
//    case lester = "Lester"
//}
