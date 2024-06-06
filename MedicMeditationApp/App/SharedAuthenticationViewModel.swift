//
//  SharedAuthenticationViewModel.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 5/06/24.
//

import Foundation

class SharedAuthenticationViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}
