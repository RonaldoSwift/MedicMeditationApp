//
//  MeditationView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 4/04/24.
//

import SwiftUI

struct MeditationView: View {
    
    @State var isActiveTools: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Meditation")
                .font(.custom("AlegreyaSans-Medium", size: 35))
            
            VStack {
                Text("Guided by a short introductory course,")
                Text("start trying meditation.")
            }
            .font(.custom("AlegreyaSans-Regular", size: 20))
            .foregroundColor(Color.gray)
            
            Image(ImageResource.meditation)
            
            Text("45:00")
                .font(.custom("AlegreyaSans-Regular", size: 38))
                .foregroundColor(Color.buttonForeGround)
            
            Button(action: {
                isActiveTools = true
            }, label: {
                Text("Start Now                ")
                    .font(.custom("AlegreyaSans-Medium", size: 25))
                    .padding(.all, 20)
                    .foregroundStyle(.white)
                    .background(Color.buttonBack)
                    .cornerRadius(10)
            })
        }
        .padding()
        .navigation(ToolsView(), $isActiveTools)
    }
}

#Preview {
    MeditationView()
}
