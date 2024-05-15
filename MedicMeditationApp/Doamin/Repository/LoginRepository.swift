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
    
    func getLoginFromWebService() {
        
    }
}

/*
 
 ACA ESTA EL EJMPLO DEL PROYECTO QUE CONTIENE EL WEB SERVICE
 COMO VES CREAS UNA VARIABLE LOGINREQUEST QUE LE ASIGNA Y ESO YO NO TENGO COMO QUEDAMOS COMO PODRIA HACER AHI
 
 func getLoginFromWebService(documentNumber: Int, internetPassword: Int) -> AnyPublisher<Authentication, Error> {
     
     let loginRequest = LoginRequest(
         documentNumber: documentNumber,
         password: internetPassword
     )
     
     return bankApi
         .fetchLogin(loginRequest: loginRequest)
         .map { (loginResponse: LoginResponse) in
             Authentication(
                 jwt: loginResponse.data.accessToken
             )
         }
         .eraseToAnyPublisher()
 }
 */
