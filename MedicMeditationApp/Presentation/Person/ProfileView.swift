//
//  ProfileView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var profileViewModel = ProfileViewModel(
        loginRepository: LoginRepository(
            medicApi: MedicJSApi(),
            memoriaLogin: MemoriaLogin(),
            dataBaseGRDB: MedicMeditationGRDB()
        )
    )
    
    @State private var textoNombreYApellido: String = ""
    @State private var textoCorreo: String = ""
    @State private var textoEdad: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Image(ImageResource.person)
            
            VStack {
                Text(textoNombreYApellido)
                    .font(.custom("AlegreyaSans-Medium", size: 35))
                
                Text("Correo: \(textoCorreo)")
                    .font(.custom("AlegreyaSans-Regular", size: 20))
                    .foregroundColor(Color.gray)
                
                Text("Edad: \(textoEdad)")
                    .font(.custom("AlegreyaSans-Regular", size: 20))
                    .foregroundColor(Color.gray)
            }
            
            HStack(spacing: 120) {
                Button(action: {}, label: {
                    Text("STATS")
                        .font(.custom("AlegreyaSans-Bold", size: 20))
                        .foregroundColor(Color.buttonBack)
                })
                
                Button(action: {}, label: {
                    Text("ACHIEVEMENTS")
                        .font(.custom("AlegreyaSans-Bold", size: 20))
                        .foregroundColor(Color.gray)
                })
            }
            Image(ImageResource.calculo)
        }
        .padding()
        .onAppear {
            profileViewModel.llamarUsuariosDeBaseDeDatos()
        }
        .onReceive(profileViewModel.$profileUiState) { profileUiState in
            switch(profileUiState) {
            case .inicial:
                break
            case .cargando:
                break
            case .error(let error):
                print("Error: \(error)")
                break
            case .success(let nombreCompleto, let usuario):
                
                textoNombreYApellido = nombreCompleto
                textoCorreo = usuario.correo
                textoEdad = usuario.edad
                break
            }
        }
    }
}

#Preview {
    ProfileView()
}
