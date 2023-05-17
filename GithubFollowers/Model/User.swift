//
//  User.swift
//  GithubFollowers
//
//  Created by Octav Radulian on 16.05.2023.
//

import Foundation

//this is the model for the user info screen

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var followers: Int
    var following: Int
    var createdAt: String
}
