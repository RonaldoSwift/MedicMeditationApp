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
    
    var sharedAuthenticationViewModel = SharedAuthenticationViewModel()
    
    var memoriaLogin = MemoriaLogin()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .authentication:
                    if memoriaLogin.getUserLogged() == true {
                        PrincipalRootView()
                    } else {
                        AuthenticationRootView()
                            .environmentObject(sharedAuthenticationViewModel)
                    }
                case .principal:
                    PrincipalRootView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
