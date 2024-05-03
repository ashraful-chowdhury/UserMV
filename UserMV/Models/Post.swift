//
//  Post.swift
//  UserMV
//
//  Created by Mohammad Ashraful Haque Chowdhury on 3/5/24.
//

import Foundation

struct Post: Decodable, Identifiable, Hashable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

