//
//  ReproductorView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct ReproductorView: View {
    var body: some View {
        VStack(spacing: 40) {
            Image(ImageResource.circulo)
            
            VStack {
                Text("Painting Forest")
                    .font(.custom("AlegreyaSans-Medium", size: 30))
                
                Text("By: Painting with Passion")
                    .font(.custom("AlegreyaSans-Regular", size: 25))
                    .foregroundColor(Color.gray)
            }
            
            Image(ImageResource.reproductorMusica)
            Image(ImageResource.pausa)
            
        }
    }
}

#Preview {
    ReproductorView()
}
