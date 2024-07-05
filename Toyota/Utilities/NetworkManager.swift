//
//  NetworkManager.swift
//  Toyota
//
//  Created by Kal Y on 7/3/24.
//

import SwiftUI

class NetworkManager {
    var cars: [Car] = []
    private let cache = NSCache<NSString, UIImage>()
    let baseURL = "https://bytelinkimage.s3.us-west-1.amazonaws.com/toyota.json"
    
    func getCarInfo() async throws -> [Car] {
        guard let url = URL(string: baseURL) else {
            throw CustomError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CustomError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            let newcars = try decoder.decode([Car].self, from: data)
            return newcars
        }catch {
            throw CustomError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }

}
