//
//  TextToolbarContent.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 10/04/24.
//

import Foundation
import SwiftUI

struct TextToolbarContent: ToolbarContent {
    var image: Image = Image(ImageResource.hamburguer)

    @Environment(\.presentationMode) var presentationMode

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                image
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }

        ToolbarItem(placement: .principal) {
                Image(ImageResource.log)
                    .resizable()
                    .frame(width: 50, height: 50)
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {}, label: {
                Image(ImageResource.person)
                    .resizable()
                    .frame(width: 40, height: 40)
            })
        }
    }
}
