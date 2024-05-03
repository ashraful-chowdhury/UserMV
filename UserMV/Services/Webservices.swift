//
//  Webservices.swift
//  UserMV
//
//  Created by Mohammad Ashraful Haque Chowdhury on 3/5/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
}

class Webservices {
    private init() {}
    
    static let shared = Webservices()
    
    func loadPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw NetworkError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let posts = try? JSONDecoder().decode([Post].self, from: data)
        return posts ?? []
    }
}
