//
//  VerificationView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 8/05/24.
//

import SwiftUI

struct VerificationView: View {
    
    @StateObject private var verificationViewModel = VerificationViewModel(verificationRepository: VerificationRepository(
        medicApi: MedicJSApi()
    ), signUpRepository: SignUpRepository(medicApi: MedicJSApi(), memoriaLogin: MemoriaLogin()
                                         )
    )
    
    @EnvironmentObject var sharedAuthenticationViewModel: SharedAuthenticationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var codigo1: String = ""
    @State var codigo2: String = ""
    @State var codigo3: String = ""
    @State var codigo4: String = ""
    @State var isActiveSignIn: Bool = false
    @State private var showAlert: Bool = false
    @State private var showLoading: Bool = false
    @State private var mensajeDeAlerta: String = ""
    @State private var tituloDeAlerta: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(ImageResource.log)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom,20)
                    .padding(.top,20)
                
                Text(L10n.Verification.Title.text)
                    .font(Fonts.AlegreyaSans.medium.swiftUIFont(size: 30))
                Text(L10n.Verification.SubTitle.text)
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                Text(L10n.Verification.SubtitleDos.text)
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                
                HStack(spacing: 40) {
                    
                    VerificationTextField(numero: $codigo1)
                    VerificationTextField(numero: $codigo2)
                    VerificationTextField(numero: $codigo3)
                    VerificationTextField(numero: $codigo4)
                    
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                .foregroundColor(Color.gray)
                
                if showLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                } else {
                    PrimaryButton(onClickInSitioWeb: {
                       verificationViewModel.startVerification(
                        codigo: "\(codigo1)\(codigo2)\(codigo3)\(codigo4)",
                        nombre: sharedAuthenticationViewModel.name,
                        correo: sharedAuthenticationViewModel.email,
                        password: sharedAuthenticationViewModel.password
                       )
                    }, textoDelButton: L10n.Verification.Verify.text)
                }
            }
            .padding()
            .padding(.bottom,130)
            
            Spacer()
            Image(ImageResource.fondo)
                .edgesIgnoringSafeArea(.all)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(tituloDeAlerta),
                message: Text(mensajeDeAlerta),
                dismissButton: .default(
                    Text(L10n.Verification.Understood.text),
                    action: {
                        if(tituloDeAlerta == "Exitoso") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                )
            )
        }
        .onReceive(verificationViewModel.$verificationUiState, perform: { verificationState in
            switch (verificationState) {
            case .inicial:
                break
            case.cargando:
                showLoading = true
            case.error(let error):
                showLoading = false
                tituloDeAlerta = "Error"
                mensajeDeAlerta = error
                showAlert = true
            case.success:
                showLoading = false
                tituloDeAlerta = "Exitoso"
                mensajeDeAlerta = "Se registro correctamente"
                showAlert = true
            }
        })
        .toolbar(content: {
            BackToolbarContent()
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    VerificationView()
}
