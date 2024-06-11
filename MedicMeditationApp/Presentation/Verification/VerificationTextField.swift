//
//  ComponentVerification.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 8/05/24.
//

import Foundation
import SwiftUI

struct VerificationTextField: View {
    var numero: Binding<String>
    
    var body: some View {
        TextField("", text: numero)
            .frame(width: 50, height: 50)
            .lineLimit(1)
    }
}

extension Binding: Equatable where Value: Equatable {
    public static func == (left: Binding<Value>, right: Binding<Value>) -> Bool {
      left.wrappedValue == right.wrappedValue
   }
}
