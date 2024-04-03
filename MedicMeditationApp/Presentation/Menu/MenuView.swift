//
//  MenuView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            WelcomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            WelcomeView()
                .tabItem {
                    Image(ImageResource.musicIcon)
                    Text("Home")
                }
            
            WelcomeView()
                .tabItem {
                    Image(ImageResource.personIcon)
                    Text("Home")
                }
        }
    }
}

#Preview {
    MenuView()
}
