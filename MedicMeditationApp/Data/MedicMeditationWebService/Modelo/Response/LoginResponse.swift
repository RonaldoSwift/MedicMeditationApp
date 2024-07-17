//
//  LoginResponse.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 13/05/24.
//

import Foundation

struct LoginResponse: Decodable {
    
    var status: String
    var data: LoginDataResponse
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct LoginDataResponse: Decodable {
    var accessToken: String
    var userId: Int
    var nameAndLastName: String
    var email: String
    var age: Int
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case nameAndLastName = "name_and_LastName"
        case userId
        case message = "mensaje"
        case accessToken = "access_token"
        case email = "email"
        case age = "age"
    }
}
