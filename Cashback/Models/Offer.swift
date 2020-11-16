//
//  Offer.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

struct Offer: Codable, Hashable {
    typealias Element = String
    
    let id: String
    let imageUrl: String?
    let name: String
    let terms: String
    let currentValue: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
        case name
        case terms
        case currentValue = "current_value"
        case description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        name = try values.decode(String.self, forKey: .name)
        terms = try values.decode(String.self, forKey: .terms)
        currentValue = try values.decode(String.self, forKey: .currentValue)
        description = try values.decode(String.self, forKey: .description)
    }
}
