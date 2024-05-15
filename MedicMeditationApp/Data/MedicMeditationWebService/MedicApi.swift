//
//  MedicApi.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 13/05/24.
//

import Foundation
import Combine

class MedicApi {
    
    func fetchLogin() -> AnyPublisher<LoginResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://localhost:8011/login") else {
            return Fail(error: RonaldoError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: RonaldoError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw RonaldoError.errorDesconocido
                }
                
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw RonaldoError.errorData(errorResponse.message)
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchSignUp() -> AnyPublisher<SignUpResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://localhost:8011/signUp") else {
            return Fail(error: RonaldoError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: RonaldoError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw RonaldoError.errorDesconocido
                }
                
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw RonaldoError.errorData(errorResponse.message)
            }
            .decode(type: SignUpResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
    
    func fetchSignUp() -> AnyPublisher<VerificationResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://localhost:8011/verification") else {
            return Fail(error: RonaldoError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: RonaldoError.errorDesconocido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw RonaldoError.errorDesconocido
                }
                
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw RonaldoError.errorData(errorResponse.message)
            }
            .decode(type: VerificationResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
    
    enum RonaldoError: Error, Equatable {
        case errorURL
        case urlInvalido
        case errorData(String)
        case errorStatusCode
        case errorDesconocido
    }
}
