//
//  AuthenticationRootView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 1/05/24.
//

import Foundation
import SwiftUI

struct AuthenticationRootView: View {
    
    @State var isActiveLogin: Bool = false
    @State var isActiveSignUp: Bool = false
    @State var isActiveForgotPasword: Bool = false
     
    var body: some View {
        NavigationView {
            SignInView(onClickLogin: {
                isActiveLogin = true
            }, onClickSignUp: {
                isActiveSignUp = true
            }, onClickForgotPasword: {
                isActiveForgotPasword = true
                }
            )
            .navigation(MenuView(), $isActiveLogin)
            .navigation(SignUpView(), $isActiveSignUp)
            .navigation(ForgotPasswordView(), $isActiveForgotPasword)
        }
    }
}
