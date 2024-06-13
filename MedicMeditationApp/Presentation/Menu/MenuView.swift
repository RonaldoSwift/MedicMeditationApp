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
                }
            
            MusicView()
                .tabItem {
                    Image(systemName: "music.note.list")
                }
            
            PersonView()
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
