//
//  BackToolbarContent.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 7/05/24.
//

import Foundation
import SwiftUI

struct BackToolbarContent: ToolbarContent {
    var image: Image = Image(ImageResource.backSignUp)
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                image
                    .resizable()
                    .frame(width: 45, height: 45)
            }
        }
    }
}
