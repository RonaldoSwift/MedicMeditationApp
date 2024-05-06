//
//  SignUpView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name: String = ""
    @State var emailAddress: String = ""
    @State var password: String = ""
    
    @State var isActiveMenu: Bool = false
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
                    
                    Text(L10n.SignUp.Title.text)
                        .font(Fonts.AlegreyaSans.medium.swiftUIFont(size: 30))
                    Text(L10n.SignUp.Subtitle.text)
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                    Text(L10n.SignUp.SubtitleDos.text)
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                    
                    TextField(L10n.SignUp.Name.text, text: $name)
                        .padding()
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                        .foregroundColor(Color.gray)
                        .background(Color.colorTextField)
                        .cornerRadius(10)
                    TextField(L10n.SignUp.EmailAddress.text, text: $emailAddress)
                        .padding()
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                        .background(Color.colorTextField)
                        .cornerRadius(10)
                    TextField(L10n.SignUp.Password.text, text: $password)
                        .padding()
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                        .background(Color.colorTextField)
                        .cornerRadius(10)
                    
                    PrimaryButton(onClickInSitioWeb: {
                        isActiveMenu = true
                    }, textoDelButton: "SIGNUP")
                    
                    HStack {
                        Text(L10n.SignUp.AlreadyHave.text)
                            .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 20))
                        Button(action: {
                            isActiveSignIn = true
                        }, label: {
                            Text(L10n.SignUp.SignIn.text)
                                .font(Fonts.AlegreyaSans.bold.swiftUIFont(size: 20))
                                .foregroundColor(Color.buttonForeGround)
                        })
                    }
                    .padding(.leading,50)
                }
                .padding()
            }
            Image(ImageResource.fondo)
                .edgesIgnoringSafeArea(.all)
        }
        .navigation(MenuView(), $isActiveMenu)
        .navigation(SignInView(onClickLogin: {}, onClickSignUp: {}, onClickForgotPasword: {}), $isActiveSignIn)
    }
}

#Preview {
    SignUpView()
}
