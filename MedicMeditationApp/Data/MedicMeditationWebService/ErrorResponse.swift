//
//  ErrorResponse.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 13/05/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: String
    let message: String
}
