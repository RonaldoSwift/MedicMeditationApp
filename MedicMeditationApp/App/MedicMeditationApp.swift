//
//  MedicMeditationApp.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 1/04/24.
//

import SwiftUI

@main
struct MedicMeditationApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var signUpViewModel = SignUpViewModel(signUpRepository: SignUpRepository(medicApi: MedicApi(), memoriaLogin: MemoriaLogin()))
    
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .authentication:
                    AuthenticationRootView()
                        .environmentObject(signUpViewModel)
                case .principal:
                    PrincipalRootView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
