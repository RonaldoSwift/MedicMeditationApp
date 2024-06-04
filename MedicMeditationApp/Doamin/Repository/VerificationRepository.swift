//
//  VerificationRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 31/05/24.
//

import Foundation
import Combine

class VerificationRepository {
    
    private let medicApi: MedicApi
    
    var cancelLbales = Set<AnyCancellable>()
    
    init(medicApi: MedicApi) {
        self.medicApi = medicApi
    }
    
    func registrarUsuarioFromWebService(nombre: String, correo: String, password: String) -> AnyPublisher<Verification, Error> {
        
        let registrarUsuarioRequest = RegistrarUsuarioRequest(
            nombre: nombre,
            correo: correo,
            password: password
        )
        
        return medicApi.fetchVerification(registrarUsuarioRequest: registrarUsuarioRequest)
            .map{ (verificationResponse: VerificationResponse) in
                Verification(
                    codigo: verificationResponse.data.message
                )
            }
            .eraseToAnyPublisher()
    }
}
