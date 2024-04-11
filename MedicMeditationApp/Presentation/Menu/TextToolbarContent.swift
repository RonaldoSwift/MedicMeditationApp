//
//  TextToolbarContent.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 10/04/24.
//

import Foundation
import SwiftUI

struct TextToolbarContent: ToolbarContent {
    var image: Image = Image(ImageResource.paintingForest)

    @Environment(\.presentationMode) var presentationMode

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                image
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }

        ToolbarItem(placement: .principal) {
                Image(ImageResource.paintingForest)
                    .resizable()
                    .frame(width: 40, height: 40)
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                Image(ImageResource.person)
                    .resizable()
                    .frame(width: 40, height: 40)
            })
        }
    }
}
