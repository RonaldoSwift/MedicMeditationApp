//
//  MusicDetalleResponse.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 18/07/24.
//

import Foundation

struct MusicDetalleResponse: Decodable {
    
    var status: String
    var data: MusicDetalleDataResponse
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
    }
}
struct MusicDetalleDataResponse: Decodable {
    var id: Int
    var idMusica: Int
    var nombreCantante: String
    var imagenURL: String
    var melodia: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case idMusica = "id_musica"
        case nombreCantante = "nombre_cantante"
        case imagenURL = "imagen"
        case melodia
    }
}
