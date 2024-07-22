//
//  ReproductorViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 18/07/24.
//

import Foundation
import Combine

final class DetalleMusicaViewModel: ObservableObject {
    
    let musicDetalleRepository: MusicDetalleRepository
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var reproductorUiState = DetalleMusicUiState.inicial
    
    init(musicDetalleRepository: MusicDetalleRepository) {
        self.musicDetalleRepository = musicDetalleRepository
    }
    
    func starMusicDetalleWebService(id: Int) {
        reproductorUiState = DetalleMusicUiState.cargando
        
        musicDetalleRepository.getMusicDetalleWebService(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.reproductorUiState = DetalleMusicUiState.error("Error de Servicio Web \(error)")
                }
            }, receiveValue: { (musicaDetalle: MusicDetalle) in
                self.reproductorUiState = DetalleMusicUiState.success(musicaDetalle)
            })
            .store(in: &cancellables)
    }
}
