//
//  Follower.swift
//  GithubFollowers
//
//  Created by Octav Radulian on 16.05.2023.
//

import Foundation

//based on our url request we need our follower object
//and these are not nil because login is the nickname and you need one to set up your git account
//and if you don't upload a pic you will get a default one => we don't need to make thse properties optional

struct Follower: Codable {
    var login: String
    var avatarUrl: String
}
