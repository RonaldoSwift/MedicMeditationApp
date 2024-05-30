//
//  SignInViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 22/05/24.
//

import Foundation
import Combine
import Dispatch

@MainActor

final class SignInViewModel: ObservableObject {
    
    let loginRepository : LoginRepository
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var loginState = LoginUiState.inicial
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    func startLogin(correo: String, password: String) {
        
        guard !correo.isEmpty else {
            self.loginState = LoginUiState.error(L10n.SignIn.EmptyMail.text)
            return
        }
        
        if password.isEmpty {
            self.loginState = LoginUiState.error(L10n.SignIn.EmptyPassword.text)
            return
        }
        
        loginState = LoginUiState.cargando
        
        loginRepository.getLoginFromWebService(
            email: correo,
            pasword: password
        )
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.loginState = LoginUiState.error("Error de Web Service \(error)")
                }
            }, receiveValue: {(signIn: SignIn) in
                self.loginRepository.saveTokenInMemory(jwtToken: signIn.jwt)
                self.loginState = LoginUiState.success
                print(signIn)
            })
            .store(in: &cancellables)
    }
}
