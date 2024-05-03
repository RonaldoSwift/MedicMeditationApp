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
                        
                        Text("Forgot Pasword")
                            .font(.custom("AlegreyaSans-Medium", size: 30))
                        Text("Forgotten your password? Fill in the")
                            .font(.custom("AlegreyaSans-Regular", size: 22))
                        Text("boxes to send a verification email to")
                            .font(.custom("AlegreyaSans-Regular", size: 22))
                        Text("your gmail address.")
                            .font(.custom("AlegreyaSans-Regular", size: 22))
                        
                        TextField("Email Address", text: $email)
                            .padding()
                            .font(.custom("AlegreyaSans-Regular", size: 18))
                            .background(Color.colorTextField)
                            .cornerRadius(10)
                        
                        PrimaryButton(onClickInSitioWeb: {
                            isActiveSignIn = true
                        }, textoDelButton: "Accept")
                        
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
