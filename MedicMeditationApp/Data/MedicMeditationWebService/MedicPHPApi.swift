//
//  MedicPHPApi.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 8/07/24.
//

import Foundation
import Combine

class MedicPHPApi {
    
    func fetchMusics() -> AnyPublisher<MusicResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://127.0.0.1/v1/musics.php") else {
            return Fail(error: MedicPHPApiError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: MedicPHPApiError.urlInvalido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw MedicPHPApiError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw MedicPHPApiError.errorData(errorResponse.message)
            }
            .decode(type: MusicResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchMusicsDetalle(id: Int) -> AnyPublisher<MusicDetalleResponse,Error> {
        guard let urlComponents = URLComponents(string: "http://127.0.0.1/v1/MusicDetalle.php?id=\(id)") else {
            return Fail(error: MedicPHPApiError.errorURL)
                .eraseToAnyPublisher()
        }
        
        guard let validUrl = urlComponents.url else {
            return Fail(error: MedicPHPApiError.urlInvalido)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: validUrl
        )
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw MedicPHPApiError.errorDesconocido
                }
                if (200 ... 299 ~= httpResponse.statusCode) {
                    return data
                }
                
                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                throw MedicPHPApiError.errorData(errorResponse.message)
            }
            .decode(type: MusicDetalleResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    enum MedicPHPApiError: Error, Equatable {
        case errorURL
        case urlInvalido
        case errorData(String)
        case errorDesconocido
    }
}
