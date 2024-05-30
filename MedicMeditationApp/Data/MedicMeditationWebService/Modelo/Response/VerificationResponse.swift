//
//  VerificationResponse.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 13/05/24.
//

import Foundation

struct VerificationResponse: Decodable {
    
    var status: String
    var data: VerificationDataResponse
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct VerificationDataResponse: Decodable {
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "mensaje"
    }
}
