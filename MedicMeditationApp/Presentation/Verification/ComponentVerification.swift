//
//  ComponentVerification.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 8/05/24.
//

import Foundation
import SwiftUI

struct ComponentVerification: View {
    @State var numberUno: String = ""
    
    var body: some View {
        TextField("", text: $numberUno)
            .frame(width: 50, height: 50)
            .onChange(of: numberUno) { newValue in
                if newValue.count > 1 {
                    numberUno = String(newValue.prefix(1))
                }
            }
    }
}
