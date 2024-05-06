//
//  ForgotPasswordView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 1/05/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var email: String = ""
    
    @State var isActiveSignIn: Bool = false
    
    var body: some View {
            VStack {
                ZStack {
                    VStack(alignment: .leading) {
                        Image(ImageResource.log)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.bottom,20)
                            .padding(.top,20)
                        
                        Text(L10n.ForgotPasword.Title.text)
                            .font(Fonts.AlegreyaSans.medium.swiftUIFont(size: 30))
                        Text(L10n.ForgotPasword.ForgottenYourPassword.text)
                            .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                        Text(L10n.ForgotPasword.BoxesToSend.text)
                            .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                        Text(L10n.ForgotPasword.YourGmail.text)
                            .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                        
                        TextField(L10n.ForgotPasword.EmailAddress.text, text: $email)
                            .padding()
                            .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        PrimaryButton(onClickInSitioWeb: {
                            isActiveSignIn = true
                        }, textoDelButton: L10n.ForgotPasword.Accept.text)
                        
                    }
                    .padding()
                }
                Spacer()
                Image(ImageResource.fondo)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigation(SignInView(onClickLogin: {}, onClickSignUp: {}, onClickForgotPasword: {}), $isActiveSignIn)
        
    }
}

#Preview {
    ForgotPasswordView()
}
