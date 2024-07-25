//
//  ReproductorView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI
import SDWebImageSwiftUI
import AVFoundation
import Combine

struct DetalleMusicView: View {
    
    @State private var showAlert: Bool = false
    @State private var showLoading: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var imagenURL: String = ""
    @State private var nombreDeCantante: String = ""
    @State private var isButtonPlayed: Bool = false
    @State private var timeIsSeconds: String = ""
    
    @EnvironmentObject private var sharedMusicViewModel : SharedMusicViewModel
    
    @ObservedObject var detalleMusicaViewModel = DetalleMusicaViewModel.init(
        musicDetalleRepository: MusicDetalleRepository(
            medicPHPApi: MedicPHPApi()
        ),
        detalleMusicMediaPlayer: DetalleMusicMediaPlayer(
            avPlayer: AVPlayer(),
            timeObserverToken: nil,
            currentProgressPublisher: PassthroughSubject<Float, Never>(),
            currentTimeInSecondsPublisher: PassthroughSubject<Double, Never>()
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
            
            HStack {
                Spacer()
                Text(timeIsSeconds)
            }
            .padding()
                        
            Slider(value: $detalleMusicaViewModel.publicadorProgressValue) {
                didChange in
                detalleMusicaViewModel.didSliderChanged(didChange)
            }
            .padding()

            Button(action: {
                isButtonPlayed.toggle()
                if isButtonPlayed {
                    detalleMusicaViewModel.detalleMusicMediaPlayer.play()
                } else {
                    detalleMusicaViewModel.detalleMusicMediaPlayer.pause()
                }
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 80, height: 80)
                        .accentColor(Color.gray as Color?)
                        .shadow(radius: 10)
                    if isButtonPlayed {
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.system(.title))
                    } else {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(.title))
                    }
                }
            })
            
            //Image(ImageResource.pausa)
            
        }
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
            detalleMusicaViewModel.starMusicDetalleWebService(id: sharedMusicViewModel.music?.id ?? 0)
        })
        .onReceive(detalleMusicaViewModel.$reproductorUiState, perform: { estadoUiState in
            switch (estadoUiState) {
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
        .onReceive(detalleMusicaViewModel.$publicadorTimeinSeconds, perform: { timeInSeconds in
            timeIsSeconds = timeInSeconds
        })
    }
}

#Preview {
    DetalleMusicView()
}
