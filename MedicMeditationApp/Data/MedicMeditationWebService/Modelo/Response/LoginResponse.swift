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
    var userName: String
    var mensaje: String
    var accessToken: String
    
    
    enum CodingKeys: String, CodingKey {
        case userName
        case mensaje
        case accessToken = "access_token"
    }
}
