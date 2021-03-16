//
//  DataModel.swift
//  Assignment
//
//  Created by AK on 15/03/21.
//

import Foundation

struct DataModel: Codable {
    var name: String?
    var sub_category: [SubCatModel]?
}

struct SubCatModel: Codable {
    var name: String?
    var display_name: String?
}
