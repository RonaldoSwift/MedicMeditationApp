//
//  MusicResponse.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 10/07/24.
//

import Foundation

struct MusicResponse: Decodable {
    
    var status: String
    var data: [MusicDataResponse]
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}

struct MusicDataResponse: Decodable {
    var id: Int
    var nombre: String
    var reproduccion: Int
    var minuto: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case reproduccion
        case minuto
    }
}
