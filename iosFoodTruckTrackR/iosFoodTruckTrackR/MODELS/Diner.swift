//
//  Diner.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/16/20.
//

import Foundation

struct Diner: Codable {
    var id: Int?
    let email: String?
    let username: String
    let password: String
    let first_name: String?
    let last_name: String?
    
    init(email: String, username: String, password: String, firstName: String, lastName: String) {
        self.email = email
        self.username = username
        self.password = password
        self.first_name = firstName
        self.last_name = lastName
    }
}
