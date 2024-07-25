//
//  SleepSession.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 4/04/24.
//

import SwiftUI

struct SleepSessionView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 40) {
            Text("Sleep Session")
                .font(.custom("AlegreyaSans-Medium", size: 35))
            
            HStack(spacing: 25) {
                
                SleepCard(
                    textoDeCard: "5h 30m",
                    subtextoDeCard: "Sleep",
                    imagenDeCard: ImageResource.sleep,
                    fondoCard: ImageResource.cardGreenWhite
                )
                
                SleepCard(
                    textoDeCard: "1h 10m",
                    subtextoDeCard: "Deep",
                    imagenDeCard: ImageResource.deep,
                    fondoCard: ImageResource.cardGreenBlack
                )
                
                SleepCard(
                    textoDeCard: "3h 30m",
                    subtextoDeCard: "Quality",
                    imagenDeCard: ImageResource.quality,
                    fondoCard: ImageResource.cardGreenWhite
                )
                
            }
            
            Text("Bedtime")
                .font(.custom("AlegreyaSans-Medium", size: 35))
            
            Image(ImageResource.cronograma)
                .padding(.leading,20)
        }
        .padding()
    }
}

#Preview {
    SleepSessionView()
}
