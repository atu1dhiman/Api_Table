//
//  MovieModel.swift
//  Api_Table
//
//  Created by Atul Dhiman on 26/08/22.
//

import Foundation
import UIKit


struct MovieModel: Codable
{
    var resultCount: Int?
    var results:[ResultModel]?
}

struct ResultModel: Codable
{
    var artistName: String?
    var kind: String?
    var artworkUrl100: String?
    let trackName: String?
}



