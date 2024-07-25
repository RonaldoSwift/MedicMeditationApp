//
//  MusicRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 10/07/24.
//

import Foundation
import Combine

class MusicRepository {
    
    private let medicPHPApi: MedicPHPApi
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicPHPApi: MedicPHPApi) {
        self.medicPHPApi = medicPHPApi
    }
    
    func getMusicFromWebService() -> AnyPublisher<[Music],Error>
    {
        return medicPHPApi.fetchMusics()
            .map { (musicResponse:MusicResponse) in
                musicResponse.data
                    .map { (musicDataResponse:MusicDataResponse) in
                    Music(
                        id: musicDataResponse.id,
                        nombre: musicDataResponse.nombre,
                        reproduccion: musicDataResponse.reproduccion,
                        minuto: musicDataResponse.minuto
                    )
                }
            }
            .eraseToAnyPublisher()
    }
}
