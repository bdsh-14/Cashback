//
//  Offer.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

struct Offer: Codable, Hashable {
    let id: String
    let imageUrl: String?
    let name: String
    let terms: String
    
    // TODO: change name as per Swift convention and use init method to decode it
    let currentValue: String
    let description: String
//    let isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
        case name
        case terms
        case currentValue = "current_value"
        case description
     //   case isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        name = try values.decode(String.self, forKey: .name)
        terms = try values.decode(String.self, forKey: .terms)
        currentValue = try values.decode(String.self, forKey: .currentValue)
        description = try values.decode(String.self, forKey: .description)
        //isFavorite = try values.decode(Bool.self, forKey: .isFavorite)
    }
    
    //Decode JSON
    
    static func offersFromJson() -> [Offer] {
        var offers: [Offer] = []
        
        //TODO: remove optional
        
        let url = Bundle.main.url(forResource: "Offers", withExtension: "json")!
      
       
        do {
            let offersData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            offers = try decoder.decode([Offer].self, from: offersData)
        } catch let error {
            print(error)
        }
        return offers
    }
}
