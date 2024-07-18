//
//  MusicUiState.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 16/07/24.
//

import Foundation

enum MusicUiState {
    case inicial
    case cargando
    case error(String)
    case success([Music])
}
