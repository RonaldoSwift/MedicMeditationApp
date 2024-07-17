//
//  MusicViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 16/07/24.
//

import Foundation
import Combine

final class MusicViewModel: ObservableObject {
    
    let musicRepository: MusicRepository
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var musicState = MusicUiState.inicial
    
    init(musicRepository: MusicRepository) {
        self.musicRepository = musicRepository
        starMusicWebService()
    }
    
    func starMusicWebService() {
        musicState = MusicUiState.cargando
        
        musicRepository.getMusicFromWebService()
        
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
            switch (completion) {
            case .finished:
                break
            case .failure(let error):
                self.musicState = MusicUiState.error("Error de Servicio Web \(error)")
            }
        }, receiveValue: { (musicas: [Music]) in
            self.musicState = MusicUiState.success(musicas)
        })
        .store(in: &cancellables)
    }
}
