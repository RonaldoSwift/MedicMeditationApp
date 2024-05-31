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
        
        //guarda que el correo no este/sea vacio, caso contrario muestra error
        guard !correo.isEmpty else {
            self.loginState = LoginUiState.error(L10n.SignIn.EmptyMail.text)
            return
        }
        
        guard isValidEmail(correo) else {
            self.loginState = LoginUiState.error("Correo Invalido")
            return
        }
        
        if password.isEmpty{
            self.loginState = LoginUiState.error(L10n.SignIn.EmptyPassword.text)
            return
        }
        
        if password.count < 5 {
            self.loginState = LoginUiState.error("Error minimo 5 caracteres")
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
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
