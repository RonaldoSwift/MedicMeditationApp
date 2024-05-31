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
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var verificationUiState = VerificationUiState.inicial
    
    init(verificationRepository: VerificationRepository) {
        self.verificationRepository = verificationRepository
    }
    
    func startVerification(codigo: String) {
        
        guard !codigo.isEmpty else {
            self.verificationUiState = VerificationUiState.error("Nombre Invalido")
         return
        }
        
        verificationUiState = VerificationUiState.cargando
        
        verificationRepository.getVerificationFromWebService()
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
