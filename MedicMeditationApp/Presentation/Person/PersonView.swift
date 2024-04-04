//
//  PersonView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct PersonView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(ImageResource.person)
                
            VStack {
                Text("Afreen Khan")
                    .font(.custom("AlegreyaSans-Medium", size: 35))

                Text("Lucknow, India")
                    .font(.custom("AlegreyaSans-Regular", size: 20))
                    .foregroundColor(Color.gray)

            }
            

            HStack(spacing: 120) {
                Button(action: {}, label: {
                    Text("STATS")
                        .font(.custom("AlegreyaSans-Bold", size: 20))
                        .foregroundColor(Color.buttonBack)

                })
                
                Button(action: {}, label: {
                    Text("ACHIEVEMENTS")
                        .font(.custom("AlegreyaSans-Bold", size: 20))
                        .foregroundColor(Color.gray)

                })
            }
            Image(ImageResource.calculo)
        }
        .padding()
    }
}

#Preview {
    PersonView()
}
