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
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicApi: MedicApi) {
        self.medicApi = medicApi
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
