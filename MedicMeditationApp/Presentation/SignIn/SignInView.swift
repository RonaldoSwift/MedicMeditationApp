//
//  SignInView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 1/04/24.
//

import SwiftUI

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isActiveMenu: Bool = false
    @State var isActiveSignUp: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack(alignment: .leading) {
                        Image(ImageResource.log)
                        
                        Text("Sign In")
                            .font(.custom("AlegreyaSans-Medium", size: 30))
                        Text("Sign in now to access your excercises")
                            .font(.custom("AlegreyaSans-Regular", size: 22))
                        Text("and save music.")
                            .font(.custom("AlegreyaSans-Regular", size: 22))
                        
                        TextField("Email Address", text: $email)
                            .padding()
                            .cornerRadius(10)
                        TextField("Password", text: $password)
                            .padding()
                            .cornerRadius(10)
                        
                        Button(action: {}, label: {
                            Text("Forgot Password?")
                                .font(.custom("AlegreyaSans-Regular", size: 14))
                                .foregroundColor(Color.buttonForgot)
                            
                        })
                        .padding(.leading,260)
                        
                        generalButtonComponent(onClickInSitioWeb: {
                            isActiveMenu = true
                        }, textoDelButton: "LOGIN")
                        
                        HStack {
                            Text("Dont have  an account?")
                                .font(.custom("AlegreyaSans-Regular", size: 20))
                            
                            Button(action: {
                                isActiveSignUp = true
                            }, label: {
                                Text("Sign Up")
                                    .font(.custom("AlegreyaSans-Bold", size: 20))
                                    .foregroundColor(Color.buttonForeGround)
                                
                            })
                        }
                        .padding(.leading,50)
                        
                    }
                    .padding()
                }
                Spacer()
                Image(ImageResource.fondo)
                    .edgesIgnoringSafeArea(.all)
            }
            .navigation(MenuView(), $isActiveMenu)
            .navigation(SignUpView(), $isActiveSignUp)
        }
    }
}

#Preview {
    SignInView()
}
