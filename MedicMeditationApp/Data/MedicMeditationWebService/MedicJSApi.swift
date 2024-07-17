//
//  MedicApi.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 13/05/24.
//

import Foundation
import Combine

class MedicJSApi {
    
    func fetchLogin(loginRequest: LoginRequest) -> AnyPublisher<LoginResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://localhost:8011/login") else {
            return Fail(error: MedicApiError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: MedicApiError.urlInvalido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "POST"
        
        let requestData = try! JSONEncoder().encode(loginRequest)
        urlRequest.httpBody = requestData
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw MedicApiError.errorDesconocido
                }
                // 202 - Cuando la aplicacion es exitoso
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                //404 - cualquier rango qeu supere al 200 y 299 en el servicio pasa automaticamente al errorResponse
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw MedicApiError.errorData(errorResponse.message)
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func sendCode(signUpRequest: SignUpRequest) -> AnyPublisher<SignUpResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://localhost:8011/enviarCodigo") else {
            return Fail(error: MedicApiError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: MedicApiError.urlInvalido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "POST"
        
        let requestData = try! JSONEncoder().encode(signUpRequest)
        urlRequest.httpBody = requestData
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw MedicApiError.errorDesconocido
                }
                
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw MedicApiError.errorData(errorResponse.message)
            }
            .decode(type: SignUpResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
    
    func registerUser(registrarUsuarioRequest: RegistrarUsuarioRequest) -> AnyPublisher<VerificationResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://localhost:8011/registrarUsuario") else {
            return Fail(error: MedicApiError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: MedicApiError.urlInvalido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "POST"
        
        let requestData = try! JSONEncoder().encode(registrarUsuarioRequest)
        urlRequest.httpBody = requestData
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw MedicApiError.errorDesconocido
                }
                
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw MedicApiError.errorData(errorResponse.message)
            }
            .decode(type: VerificationResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
    
    enum MedicApiError: Error, Equatable {
        case errorURL //Usamos estes caso cuando la url tiene un caracter especial que no es aceptable
        case urlInvalido
        case errorData(String)
        case errorDesconocido
    }
}
