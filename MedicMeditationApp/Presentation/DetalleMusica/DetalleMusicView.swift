//
//  ReproductorView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetalleMusicView: View {
    
    @State private var showAlert: Bool = false
    @State private var showLoading: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var imagenURL: String = ""
    @State private var nombreDeCantante: String = ""
    
    @EnvironmentObject private var sharedMusicViewModel : SharedMusicViewModel
    
    let reproductorViewModel = DetalleMusicaViewModel.init(
        musicDetalleRepository: MusicDetalleRepository(
            medicPHPApi: MedicPHPApi()
        )
    )
    
    var body: some View {
        VStack(spacing: 40) {
            if (!imagenURL.isEmpty) { //Es necesario el if sino no creamos el webIMAGE
                WebImage(
                    url: URL(string: imagenURL)) { image in
                        image.resizable()
                    } placeholder: {
                        //por defecto hagarra imagen del Assets
                        Image(ImageResource.hamburguer)
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
           

            VStack {
                Text("\(sharedMusicViewModel.music?.nombre ?? "Error")")
                    .font(.custom("AlegreyaSans-Medium", size: 30))
                
                Text("By: \(nombreDeCantante)")
                    .font(.custom("AlegreyaSans-Regular", size: 25))
                    .foregroundColor(Color.gray)
            }
            
            Image(ImageResource.reproductorMusica)
            Image(ImageResource.pausa)
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            TextToolbarContent()
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(mensajeDeAlerta),
                dismissButton: .default(
                    Text(L10n.Verification.Understood.text),
                    action: {
                    }
                )
            )
        }
        .onAppear(perform: {
            reproductorViewModel.starMusicDetalleWebService(id: sharedMusicViewModel.music?.id ?? 0)
        })
        .onReceive(reproductorViewModel.$reproductorUiState, perform: { reproductorMusicState in
            switch (reproductorMusicState) {
            case .inicial:
                break
            case .cargando:
                showLoading = true
            case .error(let error):
                showAlert = true
                showLoading = false
                mensajeDeAlerta = error
            case .success(let musicDetalle):
                imagenURL = musicDetalle.imagenURL
                nombreDeCantante = musicDetalle.nombreCantante
                print(musicDetalle)
                showLoading = false
                break
            }
        })
    }
}

#Preview {
    DetalleMusicView()
}
