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
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicApi: MedicApi) {
        self.medicApi = medicApi
    }
    
    func getSignUpFromWebService() -> AnyPublisher <SignUp, Error> {
        medicApi.fetchSignUp()
            .map { (signUpResponse: SignUpResponse) in
                SignUp(
                    message: signUpResponse.message ?? "Error"
                )
            }
            .eraseToAnyPublisher()
    }
}
