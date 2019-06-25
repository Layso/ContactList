//
//  User.swift
//  ContactList
//
//  Created by Can on 25.06.2019.
//  Copyright © 2019 layso. All rights reserved.
//

import Foundation



struct RandomUser: Codable {
    let results: [UserInformation]
}


struct UserInformation: Codable {
    let gender: String
    let name: UserName
    let email: String
    let picture: Pictures
    let location: Address
    let phone: String
    let cell: String
}


struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}


struct Pictures: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}


struct Address: Codable {
    let street: String
    let city: String
}
