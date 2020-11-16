//
//  NetworkManager.swift
//  Cashback
//
//  Created by Bidisha Biswas on 11/16/20.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let cache = NSCache<NSString, UIImage>()
    
    func offersFromJson() -> [Offer] {
        var offers: [Offer] = []
        guard let url = Bundle.main.url(forResource: "Offers", withExtension: "json") else { return []}
        do {
            let offersData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            offers = try decoder.decode([Offer].self, from: offersData)
        } catch let error {
            print(error)
        }
        return offers
    }
    
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completion(nil)
                return
            }
         
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
