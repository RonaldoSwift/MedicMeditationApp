//
//  GeneralButtonComponent.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 2/04/24.
//

import Foundation
import SwiftUI

@ViewBuilder
func generalButtonComponent(onClickInSitioWeb: @escaping () -> Void, textoDelButton: String) -> some View {
    Button(action: {
        onClickInSitioWeb()
    }, label: {
        Text(textoDelButton)
            .font(.custom("Alegreya-Medium", size: 25))
            .frame(maxWidth: .infinity)
            .padding(.all, 20)
            .foregroundStyle(.white)
            .background(Color.buttonBack)
            .cornerRadius(10)

    })
}
