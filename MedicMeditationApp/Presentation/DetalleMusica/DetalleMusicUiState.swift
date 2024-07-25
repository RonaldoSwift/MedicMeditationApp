//
//  ReproductorUiState.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 18/07/24.
//

import Foundation

enum DetalleMusicUiState {
    case inicial
    case cargando
    case error(String)
    case success(MusicDetalle)
}
