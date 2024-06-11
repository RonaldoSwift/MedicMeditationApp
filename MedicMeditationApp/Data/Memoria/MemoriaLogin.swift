//
//  MemoriaLogin.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 22/05/24.
//

import Foundation

class MemoriaLogin {
    private let userTokenKey = "USER_TOKEN_KEY"
    private let codigoKey = "CODIGO_KEY"
    
    private let userLoginKey = "USER_LOGIN_KEY"
    
    func setTokenDeUsuario(jwtToken: String) {
        UserDefaults.standard.set(jwtToken, forKey: userTokenKey)
    }
    
    func obtenerTokenDeUsuario() -> String {
        return UserDefaults.standard.string(forKey: userTokenKey) ?? ""
    }
    
    func setCodigoDeUsuario(codigo: String) {
        UserDefaults.standard.setValue(codigo, forKey: codigoKey)
    }
    
    func getCodigoDeUsuario() -> String {
        return UserDefaults.standard.string(forKey: codigoKey) ?? ""
    }
    
    func setUserLogged(isLogged: Bool) {
        UserDefaults.standard.set(isLogged, forKey: userLoginKey)
    }
    
    func getUserLogged() -> Bool {
        UserDefaults.standard.bool(forKey: userLoginKey)
    }
}
