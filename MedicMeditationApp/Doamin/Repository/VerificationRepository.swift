//
//  VerificationRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 31/05/24.
//

import Foundation
import Combine

class VerificationRepository {
    
    private let medicApi: MedicApi
    
    var cancelLbales = Set<AnyCancellable>()
    
    init(medicApi: MedicApi) {
        self.medicApi = medicApi
    }
    
    func getVerificationFromWebService() -> AnyPublisher<Verification, Error> {
        medicApi.fetchVerification()
            .map{ (verificationResponse: VerificationResponse) in
                Verification(
                    message: verificationResponse.data.message
                )
            }
            .eraseToAnyPublisher()
    }
}
