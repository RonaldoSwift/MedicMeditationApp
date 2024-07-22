//
//  MusicDetalleRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 18/07/24.
//

import Foundation
import Combine

class MusicDetalleRepository {
    
    private let medicPHPApi: MedicPHPApi
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicPHPApi: MedicPHPApi) {
        self.medicPHPApi = medicPHPApi
    }
    
    func getMusicDetalleWebService(id:Int) -> AnyPublisher<MusicDetalle, Error>
    {
        return medicPHPApi.fetchMusicsDetalle(id: id)
            .map { (musicDetalleResponse:MusicDetalleResponse) in
                MusicDetalle(
                    id: musicDetalleResponse.data.id,
                    idMusica: musicDetalleResponse.data.idMusica,
                    nombreCantante: musicDetalleResponse.data.nombreCantante,
                    imagenURL: musicDetalleResponse.data.imagenURL,
                    melodia: musicDetalleResponse.data.melodia
                )
            }
            .eraseToAnyPublisher()
    }
}
