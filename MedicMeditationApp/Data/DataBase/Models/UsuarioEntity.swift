//
//  UsuarioEntity.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 5/07/24.
//

import Foundation
import GRDB

struct UsuarioEntity: Codable, FetchableRecord, PersistableRecord {
    let id: Int
    let name_and_LastName: String
    let email: String
    let age: Int
}
