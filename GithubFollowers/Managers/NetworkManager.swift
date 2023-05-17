//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Octav Radulian on 17.05.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, String?) -> Void) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //we handle the 3 variables now
            
            //error
            if let _ = error {
                completed(nil, "Unable to complete request. Please check your internet connection.")
                return
            }
            //response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server, please try again")
                return
            }
            
            //handle the data
            guard let data = data else {
                completed(nil, "The data received from the server was invalid, please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "Invalid response from the server, please try again")
            }
        }
        
        task.resume()
    }
}
