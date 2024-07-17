//
//  MusicView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct MusicView: View {
    
    @State var isActiveReproductor: Bool = false
    @State private var musicArray : [Music] = []
    @State private var showAlert: Bool = false
    @State private var showLoading: Bool = false
    @State private var mensajeDeAlerta: String = ""
    
    @StateObject private var musicViewModel = MusicViewModel(
        musicRepository: MusicRepository(
            medicPHPApi: MedicPHPApi()
        )
    )
    
    var body: some View {
        VStack {
            
            MusicCard()
            
            ScrollView {
                ForEach(musicArray, id: \.id) { music in
                    celdaDeMusica(music: music)
                }
            }
        }
        .padding()
        .navigation(ReproductorView(), $isActiveReproductor)
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
        .onReceive(musicViewModel.$musicState, perform: { musicState in
            switch (musicState) {
            case .inicial:
                break
            case .cargando:
                showLoading = true
            case .error(let error):
                showAlert = true
                showLoading = false
                mensajeDeAlerta = error
            case .success(let musicas):
                musicArray = musicas
                showLoading = false
                break
            }
        })
    }
    
    func celdaDeMusica(music: Music) -> some View {
        return  HStack {
            Image(ImageResource.paintingForest)
            VStack(alignment:.leading) {
                Text("\(music.nombre)")
                    .font(.custom("AlegreyaSans-Medium", size: 20))
                
                Text("\(music.reproduccion) Listening")
                    .font(.custom("AlegreyaSans-Light", size: 12))
            }
            Spacer()
            Text("\(music.minuto) Min")
                .font(.custom("AlegreyaSans-Medium", size: 15))
        }
        .padding()
    }
}

#Preview {
    MusicView()
}
