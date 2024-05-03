//
//  AppRootManager.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 30/04/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots = .authentication
    
    enum AppRoots {
        case authentication
        case principal
    }
}
