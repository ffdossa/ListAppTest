//
//  UserModel.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import Foundation


struct UserModel: Codable {
    let id: String
    let username: String
    let email: String
    let timeJoined: TimeInterval
}
