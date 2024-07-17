//
//  ProfileViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 5/07/24.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    
    let loginRepository: LoginRepository
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var profileUiState = ProfileUiState.inicial
    
    init(loginRepository: LoginRepository){
        self.loginRepository = loginRepository
        observarPublicadorDeUsuarios()
    }
    
    func llamarUsuariosDeBaseDeDatos() {
        loginRepository.llamarUsuariosDeBaseDeDatos()
    }
    
    private func observarPublicadorDeUsuarios() {
        loginRepository.getPublicadorDeUsuariosDeBaseDeDatos()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch(completion) {
                case .finished:
                    print("Usuario Obtenido")
                case .failure(let error):
                    print("\(error)")
                }
            } receiveValue: { (usuarios :[Usuario]) in
                let primerUsuario = usuarios[0]
                self.profileUiState = ProfileUiState.success("\(primerUsuario.nombreYApellido) \(primerUsuario.id)", primerUsuario)
            }
            .store(in: &cancellables)
    }
    
}
