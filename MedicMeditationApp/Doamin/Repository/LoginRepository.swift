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
    
    func saveTokenInMemory(jwtToken: String) {
        memoriaLogin.setTokenDeUsuario(jwtToken: jwtToken)
    }
    
    func getTokenFromMemoria() -> String {
        return memoriaLogin.obtenerTokenDeUsuario()
    }
    
    func getLoginFromWebService() -> AnyPublisher <SignIn, Error> {
        medicApi.fetchLogin()
            .map { (loginResponse: LoginResponse) in
                SignIn(
                    jwt: loginResponse.data.userName
                )
            }
            .eraseToAnyPublisher()
    }
}
