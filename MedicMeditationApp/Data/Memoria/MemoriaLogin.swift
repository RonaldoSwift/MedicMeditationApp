//
//  MemoriaLogin.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 22/05/24.
//

import Foundation

class MemoriaLogin {
    private let userTokenKey = "USER_TOKEN_KEY"
    
    func setTokenDeUsuario(jwtToken: String) {
        UserDefaults.standard.set(jwtToken, forKey: userTokenKey)
    }
    
    func obtenerTokenDeUsuario() -> String {
        return UserDefaults.standard.string(forKey: userTokenKey) ?? ""
    }
}
