//
//  SleepCard.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 24/07/24.
//

import Foundation
import SwiftUI

struct SleepCard: View {
    
    var textoDeCard : String
    var subtextoDeCard : String
    var imagenDeCard : ImageResource
    var fondoCard : ImageResource

    var body: some View {
        ZStack {
            Image(fondoCard)
            VStack {
                Image(imagenDeCard)
                    .padding(.vertical,10)
                VStack {
                    Text(textoDeCard)
                        .font(.custom("AlegreyaSans-Medium", size: 18))
                    
                    Text(subtextoDeCard)
                        .font(.custom("AlegreyaSans-Regular", size: 12))
                }
                .foregroundColor(Color.white)
            }
        }
    }
}
