//
//  LoginRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 14/05/24.
//

import Foundation
import Combine

class LoginRepository {
    
    private let medicApi: MedicApi
    private let memoriaLogin: MemoriaLogin
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicApi: MedicApi, memoriaLogin: MemoriaLogin) {
        self.medicApi = medicApi
        self.memoriaLogin = memoriaLogin
    }
    
    func saveUserLoggedInCache(isLogged: Bool) {
        memoriaLogin.setUserLogged(isLogged: isLogged)
    }
    
    func saveTokenInMemory(jwtToken: String) {
        memoriaLogin.setTokenDeUsuario(jwtToken: jwtToken)
    }
    
    func getTokenFromMemoria() -> String {
        return memoriaLogin.obtenerTokenDeUsuario()
    }
    
    func getLoginFromWebService(email: String, pasword: String) -> AnyPublisher<SignIn,Error> {
        
        let loginRequest = LoginRequest(
            email: email,
            pasword: pasword
        )
        
        return medicApi.fetchLogin(loginRequest: loginRequest)
            .map { (loginResponse: LoginResponse) in
                SignIn(
                    jwt: loginResponse.data.accessToken
                )
            }
            .eraseToAnyPublisher()
    }
}
