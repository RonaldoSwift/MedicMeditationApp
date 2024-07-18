//
//  ProfileUiState.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 5/07/24.
//

import Foundation

enum ProfileUiState {
    case inicial
    case cargando
    case error(String)
    case success(String, Usuario)
}
