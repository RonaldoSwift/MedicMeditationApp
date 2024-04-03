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
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading) {
                    Image(ImageResource.log)
                        .resizable()
                        .frame(width: 170, height: 170)
                    Text("Sign Up")
                        .font(.custom("AlegreyaSans-Medium", size: 30))
                    Text("Sign up now for free and start")
                        .font(.custom("AlegreyaSans-Regular", size: 22))
                    Text("meditating, and explore Medic.")
                        .font(.custom("AlegreyaSans-Regular", size: 22))
                    
                    TextField("Name", text: $name)
                        .padding()
                        .cornerRadius(10)
                    TextField("Email Address", text: $emailAddress)
                        .padding()
                        .cornerRadius(10)
                    TextField("Password", text: $password)
                        .padding()
                        .cornerRadius(10)
                    
                    generalButtonComponent(onClickInSitioWeb: {}, textoDelButton: "SIGNUP")
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.custom("AlegreyaSans-Regular", size: 20))
                        
                        Button(action: {}, label: {
                            Text("Sign In")
                                .font(.custom("AlegreyaSans-Bold", size: 20))
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
    }
}

#Preview {
    SignUpView()
}
