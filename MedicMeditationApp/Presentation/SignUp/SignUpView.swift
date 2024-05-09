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
    
    @State var isActiveSignUp: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
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
            }
            Image(ImageResource.fondo)
                .edgesIgnoringSafeArea(.all)
        }
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
