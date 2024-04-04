//
//  ToolsView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 4/04/24.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tools")
                .font(.custom("AlegreyaSans-Medium", size: 35))
            
            HStack(spacing: 30) {
                ZStack {
                    Image(ImageResource.backGroundCard)
                    Image(ImageResource.nubeGreen)
                        .padding(.top,20)
                    VStack(alignment: .leading) {
                        Image(ImageResource.moodJournal)
                        Text("Mood Journal")
                            .font(.custom("AlegreyaSans-Medium", size: 18))
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 30)
                    
                }
                
                ZStack {
                    Image(ImageResource.backGroundCard)
                    Image(ImageResource.nubeGreen)
                        .padding(.top,20)
                    VStack(alignment: .leading) {
                        Image(ImageResource.moodJournal)
                        Text("Mood Journal")
                            .font(.custom("AlegreyaSans-Medium", size: 18))
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 30)
                    
                }
            }
            
            HStack(spacing: 30) {
                ZStack {
                    Image(ImageResource.backGroundCard)
                    Image(ImageResource.nubeGreen)
                        .padding(.top,20)
                    VStack(alignment: .leading) {
                        Image(ImageResource.moodJournal)
                        Text("Mood Journal")
                            .font(.custom("AlegreyaSans-Medium", size: 18))
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 30)
                    
                }
                
                ZStack {
                    Image(ImageResource.backGroundCard)
                    Image(ImageResource.nubeGreen)
                        .padding(.top,20)
                    VStack(alignment: .leading) {
                        Image(ImageResource.moodJournal)
                        Text("Mood Journal")
                            .font(.custom("AlegreyaSans-Medium", size: 18))
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 30)
                    
                }
            }
            
            HStack(spacing: 30) {
                ZStack {
                    Image(ImageResource.backGroundCard)
                    Image(ImageResource.nubeGreen)
                        .padding(.top,20)
                    VStack(alignment: .leading) {
                        Image(ImageResource.moodJournal)
                        Text("Mood Journal")
                            .font(.custom("AlegreyaSans-Medium", size: 18))
                            .foregroundColor(Color.white)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 30)
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ToolsView()
}
