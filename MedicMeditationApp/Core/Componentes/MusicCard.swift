//
//  MusicCard.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 16/07/24.
//

import Foundation
import SwiftUI

struct MusicCard: View {
    
    var body: some View {
        ZStack {
            Image(ImageResource.cardRelax)
            
            VStack(alignment: .leading) {
                Text("Relax Sounds")
                    .font(.custom("AlegreyaSans-Medium", size: 27))
                    .foregroundColor(Color.white)
                Text("Sometimes the most productive")
                    .font(.custom("AlegreyaSans-Medium", size: 15))
                    .foregroundColor(Color.white)
                Text("thing you can do is relax.")
                    .font(.custom("AlegreyaSans-Medium", size: 15))
                    .foregroundColor(Color.white)
                
                Button(action: {
                }, label: {
                    HStack {
                        Text("play now")
                        Image(ImageResource.playBlack)
                    }
                    .font(.custom("AlegreyaSans-Medium", size: 15))
                    .padding(.all, 15)
                    .foregroundStyle(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                })
            }
            .padding(.trailing,80)
        }
    }
}
