//
//  VerificationView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 8/05/24.
//

import SwiftUI

struct VerificationView: View {
    
    @State var numberUno: String = ""
    @State var numberDos: String = ""
    @State var numberTres: String = ""
    @State var numberCuatro: String = ""
    
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
                    
                    Text("Verify Phone Number")
                        .font(Fonts.AlegreyaSans.medium.swiftUIFont(size: 30))
                    Text("We have sent you a 4 digit code. Please")
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                    Text("enter here to Verify your Number.")
                        .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 22))
                    
                    HStack(spacing: 40){
                        ForEach(0..<4) { index in
                            //Observacion
                            ComponentVerification(numberUno: numberUno)
                        }
                    }
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(Fonts.AlegreyaSans.regular.swiftUIFont(size: 18))
                    .foregroundColor(Color.gray)
                    
                    PrimaryButton(onClickInSitioWeb: {
                        isActiveSignIn = true
                    }, textoDelButton: "Verify")
                }
                .padding()
                .padding(.bottom,130)
                
            }
            Image(ImageResource.fondo)
                .edgesIgnoringSafeArea(.all)
        }
        .toolbar(content: {
            BackToolbarContent()
        })
        .navigationBarBackButtonHidden(true)
        .navigation(SignInView(onClickLogin: {}, onClickSignUp: {}, onClickForgotPasword: {}), $isActiveSignIn)
    }
}

#Preview {
    VerificationView()
}
