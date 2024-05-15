//
//  SignUpResponse.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 13/05/24.
//

import Foundation

struct SignUpResponse: Decodable {
    
    var status: String
    var data: SignUpDataResponse
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct SignUpDataResponse: Decodable {
    var mensaje: String
    
    enum CodingKeys: String, CodingKey {
        case mensaje
    }
}
