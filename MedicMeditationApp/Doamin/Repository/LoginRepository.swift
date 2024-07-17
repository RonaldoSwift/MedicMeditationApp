//
//  LoginRepository.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 14/05/24.
//

import Foundation
import Combine

class LoginRepository {
    
    private let medicJSApi: MedicJSApi
    private let memoriaLogin: MemoriaLogin
    private let dataBaseGRDB: MedicMeditationGRDB
    
    var cancelLables = Set<AnyCancellable>()
    
    init(medicApi: MedicJSApi, memoriaLogin: MemoriaLogin, dataBaseGRDB: MedicMeditationGRDB) {
        self.medicJSApi = medicApi
        self.memoriaLogin = memoriaLogin
        self.dataBaseGRDB = dataBaseGRDB
    }
    
    func saveUserLoggedInCache(isLogged: Bool) {
        memoriaLogin.setUserLogged(isLogged: isLogged)
    }
    
    func saveTokenInMemory(jwtToken: String) {
        memoriaLogin.setTokenDeUsuario(jwtToken: jwtToken)
    }
    
    func getTokenFromMemoria() -> String {
        return memoriaLogin.obtenerTokenDeUsuario()
    }
    
    func getLoginFromWebService(email: String, pasword: String) -> AnyPublisher<SignIn,Error> {
        
        let loginRequest = LoginRequest(
            email: email,
            pasword: pasword
        )
        
        return medicJSApi.fetchLogin(loginRequest: loginRequest)
            .map { (loginResponse: LoginResponse) in
                SignIn(
                    jwt: loginResponse.data.accessToken,
                    idDeUsuario: loginResponse.data.userId,
                    nombreYApellidoDeUsuario: loginResponse.data.nameAndLastName,
                    correo: loginResponse.data.email,
                    edad: loginResponse.data.age
                )
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: Funciones de Base De Datos , solo da la orden el publicador
    func getPublicadorDeUsuariosDeBaseDeDatos() ->AnyPublisher<[Usuario], Error> {
        dataBaseGRDB
            .publicadorGetUsuarios
            .map { (usuariosEntity: [UsuarioEntity]) in
                usuariosEntity.map { (usuarioEntity: UsuarioEntity) in
                    Usuario(
                        id: usuarioEntity.id,
                        nombreYApellido: usuarioEntity.name_and_LastName,
                        correo: usuarioEntity.email,
                        edad: usuarioEntity.age
                    )
                }
            }
            .eraseToAnyPublisher()
    }
    
    func llamarUsuariosDeBaseDeDatos() {
        dataBaseGRDB
            .getUserFromTable()
    }
    
    func insertarUsuarioEnBaseDeDatos(id:Int, nombreUsuario: String, correo: String, edad: Int) {
        dataBaseGRDB.insertUserIntTable(
            id: id,
            nombreYApellidoDeUsuario: nombreUsuario,
            correo: correo,
            edad: edad
        )
    }
}
