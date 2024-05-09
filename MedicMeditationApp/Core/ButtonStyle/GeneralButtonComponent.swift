//
//  GeneralButtonComponent.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 2/04/24.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    var onClickInSitioWeb: () -> Void
    var textoDelButton : String
    
    var body: some View {
        Button(action: {
            onClickInSitioWeb()
        }, label: {
            Text(textoDelButton)
                .font(.custom("Alegreya-Medium", size: 20))
                .frame(maxWidth: .infinity)
                .padding(.all, 20)
                .foregroundStyle(.white)
                .background(Color.buttonBack)
                .cornerRadius(10)
        })
    }
}
