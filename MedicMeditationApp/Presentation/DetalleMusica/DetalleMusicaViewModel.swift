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
    let detalleMusicMediaPlayer : DetalleMusicMediaPlayer
    var acceptProgressUpdates = true
    @Published var publicadorProgressValue: Float = 0
    @Published var publicadorTimeinSeconds: String = ""
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var reproductorUiState = DetalleMusicUiState.inicial
    
    init(musicDetalleRepository: MusicDetalleRepository, detalleMusicMediaPlayer: DetalleMusicMediaPlayer) {
        self.musicDetalleRepository = musicDetalleRepository
        self.detalleMusicMediaPlayer = detalleMusicMediaPlayer
        subscribeToProgress()
        subsCribeToTimeinSecon()
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
                //cambiar nombre
                //inicializarAVPLayer(musicaDetalle.melodia)
                self.detalleMusicMediaPlayer.inicializarAVPLayer(url: musicaDetalle.melodia)
                self.reproductorUiState = DetalleMusicUiState.success(musicaDetalle)
            })
            .store(in: &cancellables)
    }
    
    func subscribeToProgress() {
        detalleMusicMediaPlayer.currentProgressPublisher.sink { [weak self] progress in
            guard let self = self,
                  self.acceptProgressUpdates else { return }
            self.publicadorProgressValue = progress
        }.store(in: &cancellables)
    }
    
    func subsCribeToTimeinSecon() {
        detalleMusicMediaPlayer.currentTimeInSecondsPublisher.sink { timeinSeconds in
            self.publicadorTimeinSeconds = "\(Int(timeinSeconds))s"
        }.store(in: &cancellables)
    }
    
    func didSliderChanged(_ didChange: Bool) {
        acceptProgressUpdates = !didChange
        if didChange {
            detalleMusicMediaPlayer.pause()
        } else {
            detalleMusicMediaPlayer.play()
        }
    }
}
