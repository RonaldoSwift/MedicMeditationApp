//
//  RegistrarUsuarioRequest.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 4/06/24.
//

import Foundation

struct RegistrarUsuarioRequest: Encodable {
    let nombre: String
    let correo: String
    let password: String
}
