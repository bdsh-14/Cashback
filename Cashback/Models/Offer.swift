//
//  Offer.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/10/20.
//

import UIKit

struct Offers: Codable {
    let offers: [Offer] = []
}

struct Offer: Codable, Hashable {
    let id: String
    let url: String?
    let name: String
    let terms: String
    
    // TODO: change name as per Swift convention and use init method to decode it
    let current_value: String
    let description: String
    
    //Decode JSON
    
    static func offersFromJson() -> [Offer] {
        var offers: [Offer] = []
        
        //TODO: remove optional
        
        let url = Bundle.main.url(forResource: "Offers", withExtension: "json")!
      
       
        do {
            let offersData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            offers = try decoder.decode([Offer].self, from: offersData)
            print(offers)
        } catch let error {
            print(error)
        }
        
        
        
        return offers
        
//        do {
//            let data = try Data(contentsOf: url)
//            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String: Any]]
//
//            for i in 0..<json.count {
//                let name = json[i]["name"] as? String
//                names.append(name!)
//            }
//
//            let decoder = JSONDecoder()
//            let offer = try decoder.decode(Offer.self, from: data)
//
//            //let name = json[0]["name"] as? String
//            print(names)
//        } catch {
//            print("Error occured while parsing", error)
//        }
        
        
        
    }
}
