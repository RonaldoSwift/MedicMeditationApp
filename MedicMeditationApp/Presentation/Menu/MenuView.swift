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
            NavigationView{
                WelcomeView()
            }
                .tabItem {
                    Image(systemName: "house")
                }
            NavigationView {
                MusicView()
            }.tabItem {
                Image(systemName: "music.note.list")
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(Color.buttonBack)
        .toolbar(content: {
            TextToolbarContent()
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MenuView()
}
