//
//  Store.swift
//  UserMV
//
//  Created by Mohammad Ashraful Haque Chowdhury on 3/5/24.
//

import Foundation

@MainActor
class Store: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    
    
    func onAppear() async {
        do {
            try await fetchPosts()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func fetchPosts() async throws {
        isLoading = true
        posts = try await Webservices.shared.loadPosts()
        isLoading = false
    }
}
