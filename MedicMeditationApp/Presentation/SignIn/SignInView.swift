//
//  SignInView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 1/04/24.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject private var signInViewModel = SignInViewModel(
        loginRepository: LoginRepository(
            medicApi: MedicJSApi(),
            memoriaLogin: MemoriaLogin(),
            dataBaseGRDB: MedicMeditationGRDB()
        )
    )
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var showLoading: Bool = false
    @State private var mensajeDeAlerta: String = ""
    
    var onClickLogin: () -> Void
    var onClickSignUp: () -> Void
    var onClickForgotPasword: () -> Void
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(ImageResource.log)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom,20)
                    .padding(.top,20)
                
                Text(L10n.SignIn.Title.text)
                    .font(Fonts.AlegreyaSans.medium.swiftUIFont(size: 30))
                Text(L10n.SignIn.Subtitle.text)
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                Text(L10n.SignIn.SubtitleDos.text)
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                
                TextField(L10n.SignIn.Email.text, text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                
                TextField(L10n.SignIn.Password.text, text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                
                HStack {
                    Spacer()
                    Button(action: {
                        onClickForgotPasword()
                    }, label: {
                        Text(L10n.SignIn.ForgotPassword.text)
                            .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 14))
                            .foregroundColor(Color.buttonForgot)
                        
                    })
                    .padding(.bottom,30)
                }
                
                // LOADING
                if showLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                } else {
                    PrimaryButton(onClickInSitioWeb: {
                        //appRootManager.currentRoot = .principal
                        //onClickLogin()
                        signInViewModel.startLogin(correo: email, password: password)
                    }, textoDelButton: L10n.SignIn.Login.text)
                }
                
                HStack {
                    Spacer()
                    Text(L10n.SignIn.DonthaveAnAccount.text)
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 20))
                        .foregroundColor(Color.buttonForeGround)
                    
                    Button(action: {
                        onClickSignUp()
                    }, label: {
                        Text(L10n.SignIn.SignUp.text)
                            .font(Fonts.AlegreyaSans.bold.swiftUIFont(size: 20))
                            .foregroundColor(Color.buttonForeGround)
                    })
                    Spacer()
                }
            }
            .padding()
            
            Spacer()
            Image(ImageResource.fondo)
                .edgesIgnoringSafeArea(.all)
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
        .onReceive(signInViewModel.$loginState, perform: { loginState in
            switch (loginState) {
            case .inicial:
                break
            case .cargando:
                showLoading = true
            case .error(let error):
                showAlert = true
                showLoading = false
                mensajeDeAlerta = error
            case .success:
                appRootManager.currentRoot = .principal
                showLoading = false
            }
        })
    }
}

#Preview {
    SignInView(
        onClickLogin: {},
        onClickSignUp: {},
        onClickForgotPasword: {}
    )
}
