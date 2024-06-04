//
//  SignUpView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var signUpViewModel = SignUpViewModel(
        signUpRepository: SignUpRepository(
            medicApi: MedicApi(),
            memoriaLogin: MemoriaLogin()
        )
    )
    
    @State private var name: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var showLoading: Bool = false
    @State private var mensajeDeAlerta: String = ""
    
    @State var isActiveSignUp: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(ImageResource.log)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom,20)
                    .padding(.top,20)
                
                Text(L10n.SignUp.Title.text)
                    .font(Fonts.AlegreyaSans.medium.swiftUIFont(size: 30))
                Text(L10n.SignUp.Subtitle.text)
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                Text(L10n.SignUp.SubtitleDos.text)
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                
                VStack(spacing: 20){
                    TextField(L10n.SignUp.Name.text, text: $name)
                    
                    TextField(L10n.SignUp.EmailAddress.text, text: $emailAddress)
                    
                    TextField(L10n.SignUp.Password.text, text: $password)
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                .foregroundColor(Color.gray)
                
                PrimaryButton(onClickInSitioWeb: {
                    isActiveSignUp = true
                    signUpViewModel.startSignUp(name: name, emailAddress: emailAddress, password: password)
                }, textoDelButton: L10n.SignUp.SignUp.text)
                
                HStack {
                    Text(L10n.SignUp.AlreadyHave.text)
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 20))
                    Button(action: {
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text(L10n.SignUp.SignIn.text)
                            .font(Fonts.AlegreyaSans.bold.swiftUIFont(size: 20))
                            .foregroundColor(Color.buttonForeGround)
                    })
                }
                .padding(.leading,50)
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
                    Text("Entendido"),
                    action: {
                    }
                )
            )
        }
        .onReceive(signUpViewModel.$signUpState, perform: { loginState in
            switch (loginState) {
            case .inicial:
                break
            case.cargando:
                showLoading = true
            case.error(let error):
                showAlert = true
                showLoading = false
                mensajeDeAlerta = error
            case.success:
                isActiveSignUp = true
                showLoading = false
            }
        })
        .toolbar(content: {
            BackToolbarContent()
        })
        .navigationBarBackButtonHidden(true)
        .navigation(VerificationView(), $isActiveSignUp)
    }
}

#Preview {
    SignUpView()
}
