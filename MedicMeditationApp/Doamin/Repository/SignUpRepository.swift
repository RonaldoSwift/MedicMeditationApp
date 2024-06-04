//
//  SignUpRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 24/05/24.
//

import Foundation
import Combine

class SignUpRepository {
    
    private let medicApi: MedicApi
    private let memoriaLogin: MemoriaLogin
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicApi: MedicApi, memoriaLogin: MemoriaLogin) {
        self.medicApi = medicApi
        self.memoriaLogin = memoriaLogin
    }
    
    func setCodigoEnMemoria(codigo: String) {
        memoriaLogin.setCodigoDeUsuario(codigo: codigo)
    }
    
    func getCodigoDeMemoria() -> String {
        return memoriaLogin.getCodigoDeUsuario()
    }
    
    func getSignUpFromWebService(email: String) -> AnyPublisher<SignUp, Error> {
        
        let signUpRequest = SignUpRequest(
            email: email
        )
        
        return medicApi.fetchSignUp(signUpRequest: signUpRequest)
            .map { (signUpResponse: SignUpResponse) in
                SignUp(
                    message: signUpResponse.data.message, codigo: signUpResponse.data.codigo
                )
            }
            .eraseToAnyPublisher()
    }
}
