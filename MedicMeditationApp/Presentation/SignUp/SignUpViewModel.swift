//
//  SignUpViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 24/05/24.
//

import Foundation
import Combine
import Dispatch

@MainActor
final class SignUpViewModel: ObservableObject {
    
    let signUpRepository: SignUpRepository
    
    var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var signUpState = SignUpUiState.inicial
    
    init(signUpRepository: SignUpRepository) {
        self.signUpRepository = signUpRepository
    }
    
    func startSignUp(name: String, emailAddress: String, password: String) {
        
        guard !name.isEmpty else {
            self.signUpState = SignUpUiState.error("Nombre vacio")
         return
        }
        
        guard !emailAddress.isEmpty else {
            self.signUpState = SignUpUiState.error("Correo Vacio")
            return
        }
        
        guard isValidEmail(emailAddress) else {
            self.signUpState = SignUpUiState.error("Email incorrecto")
            return
        }
        
        guard !password.isEmpty else {
            self.signUpState = SignUpUiState.error("Password invalido")
            return
        }
        
        signUpState = SignUpUiState.cargando
        
        signUpRepository.getSignUpFromWebService(email: emailAddress)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.signUpState = SignUpUiState.error("Error en WebService \(error)")
                }
            }, receiveValue: {(signUp: SignUp) in
                self.signUpRepository.setCodigoEnMemoria(codigo: signUp.codigo)
                self.signUpState = SignUpUiState.success
            })
            .store(in: &cancellables)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
