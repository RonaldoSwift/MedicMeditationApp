//
//  WelcomeCard.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 24/07/24.
//

import Foundation
import SwiftUI

struct WelcomeCard: View {
    
    var onClickInSitioWeb: () -> Void
    var tituloDeCard : String
    var subtituloCardPrimer : String
    var subtituloCardSegund : String
    var textoDelButton : String
    var imagenDeCard : ImageResource
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
            )
            .mask(RoundedRectangle(cornerRadius: 12))
            .frame(width: 339, height: 170)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
            
            VStack(alignment: .leading) {
                ZStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text(tituloDeCard)
                                .font(.custom("AlegreyaSans-Medium", size: 25))
                            
                                .foregroundColor(Color.foreGroundTitle)
                            
                            Text(subtituloCardPrimer)
                                .font(.custom("AlegreyaSans-Medium", size: 15))
                                .foregroundColor(Color.foreGroundCard)
                            
                            Text(subtituloCardSegund)
                                .font(.custom("AlegreyaSans-Medium", size: 15))
                                .foregroundColor(Color.foreGroundCard)
                            
                            Button(action: {
                                onClickInSitioWeb()
                            }, label: {
                                HStack {
                                    Text(textoDelButton)
                                    Image(ImageResource.play)
                                }
                                .font(.custom("AlegreyaSans-Medium", size: 15))
                                .padding(.all, 15)
                                .foregroundStyle(.white)
                                .background(Color.buttonBack)
                                .cornerRadius(10)
                            })
                        }
                        Image(imagenDeCard)
                    }
                    .padding(.bottom,40)
                }
            }
            .padding(.top, 38)
            .frame(width: 339, height: 170)
            .background(Color.backGroundCard)
            .foregroundColor(Color.white)
            .cornerRadius(12)
        }
        .padding(.leading,10)
    }
}
