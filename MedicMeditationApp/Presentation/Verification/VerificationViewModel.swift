//
//  VerificationViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 31/05/24.
//

import Foundation
import Combine
import Dispatch

@MainActor
final class VerificationViewModel: ObservableObject {
    
    let verificationRepository: VerificationRepository
    let signUpRepository: SignUpRepository
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var verificationUiState = VerificationUiState.inicial
    
    init(verificationRepository: VerificationRepository, signUpRepository: SignUpRepository) {
        self.verificationRepository = verificationRepository
        self.signUpRepository = signUpRepository
    }
    
    func startVerification(codigo: String, nombre: String, correo: String, password: String) {
        
        let codigoDeMemoria = signUpRepository.getCodigoDeMemoria()
        
        guard !codigo.isEmpty else {
            self.verificationUiState = VerificationUiState.error("Nombre Invalido")
         return
        }
        
        guard codigo == codigoDeMemoria else {
            self.verificationUiState = VerificationUiState.error("Codigo no coincide")
            return
        }
        
        verificationUiState = VerificationUiState.cargando
        
        verificationRepository.registrarUsuarioFromWebService(nombre: nombre, correo: correo, password: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.verificationUiState = VerificationUiState.error("Error en WebService \(error)")
                }
            }, receiveValue: {(verification: Verification) in
                
                self.verificationUiState = VerificationUiState.success
                print(verification)
            })
            .store(in: &cancellables)
    }
    
}
