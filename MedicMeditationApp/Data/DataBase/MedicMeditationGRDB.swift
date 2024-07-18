//
//  MedicMeditationGRDB.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 14/06/24.
//

import Foundation
import Combine
import GRDB

var databaseQueue: DatabaseQueue!

class MedicMeditationGRDB {
    
    let publicadorInsertarUsuario = PassthroughSubject<String, Error>()
    let publicadorGetUsuarios = PassthroughSubject<[UsuarioEntity], Error>()
    
    @available(iOS 16, *)
    func inicializadorBaseDeDatosiOS16() {
        let fileManager = FileManager.default
        let dataBaseURL = try! fileManager.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appending(path: "database.sqlite")
        let dataBasePath = dataBaseURL.path()
        
        databaseQueue = try! DatabaseQueue(path: dataBasePath)
    }
    
    //iOS4
    func inicializadorBaseDeDatosiOS14() {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("db.sqlite")
        let dataBasePath = fileURL.path
        databaseQueue = try! DatabaseQueue(path: dataBasePath)
    }
    
    func crearTablaDeUsuario() {
        do {
            try databaseQueue.write ({ dataBase in
                try dataBase.create(table: "UsuarioEntity",body: { tableDefinition in
                    tableDefinition.primaryKey("id", .integer)
                    tableDefinition.column("name_and_LastName", .text).notNull()
                    tableDefinition.column("email", .text).notNull()
                    tableDefinition.column("age", .integer).notNull()
                })
            })
        } catch let error {
            print("*******ERROR EN LA CREACION DE TABLA*****")
            print(error)
        }
    }
    
    func insertUserIntTable(id: Int, nombreYApellidoDeUsuario: String, correo: String, edad: Int) {
        let usuarioEntity = UsuarioEntity(
            id: id,
            name_and_LastName: nombreYApellidoDeUsuario,
            email: correo,
            age: edad
        )
        
        do {
            try databaseQueue.write({ database in
                try usuarioEntity.insert(database)
                publicadorInsertarUsuario.send("Se inserto Correctamente")
            })
        } catch let error {
            publicadorInsertarUsuario.send(completion: .failure(error))
        }
    }
    
    func getUserFromTable() {
        let usuariosEntity: [UsuarioEntity] = try! databaseQueue.read({ database in
            try UsuarioEntity.fetchAll(database)
        })
        
        publicadorGetUsuarios.send(usuariosEntity)
    }
}
