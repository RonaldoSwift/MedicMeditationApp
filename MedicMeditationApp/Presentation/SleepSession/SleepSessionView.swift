//
//  SleepSession.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 4/04/24.
//

import SwiftUI

struct SleepSessionView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 40) {
            Text("Sleep Session")
                .font(.custom("AlegreyaSans-Medium", size: 35))
            
            HStack(spacing: 25) {
                ZStack {
                    Image(ImageResource.cardGreenWhite)
                    VStack {
                        Image(ImageResource.sleep)
                        VStack {
                            Text("5h 30m")
                                .font(.custom("AlegreyaSans-Medium", size: 18))
                            
                            Text("Sleep")
                                .font(.custom("AlegreyaSans-Regular", size: 12))
                        }
                        .foregroundColor(Color.white)
                    }
                }
                
                ZStack {
                    Image(ImageResource.cardGreenBlack)
                    VStack {
                        Image(ImageResource.deep)
                        VStack {
                            Text("1h 10m")
                                .font(.custom("AlegreyaSans-Medium", size: 18))
                            
                            Text("Deep")
                                .font(.custom("AlegreyaSans-Regular", size: 12))
                        }
                        .foregroundColor(Color.white)
                    }
                }
                
                ZStack {
                    Image(ImageResource.cardGreenWhite)
                    VStack {
                        Image(ImageResource.quality)
                        VStack {
                            Text("3h 30m")
                                .font(.custom("AlegreyaSans-Medium", size: 18))
                            
                            Text("Quality")
                                .font(.custom("AlegreyaSans-Regular", size: 12))
                            
                        }
                    }
                    .foregroundColor(Color.white)
                }
            }
            
            Text("Bedtime")
                .font(.custom("AlegreyaSans-Medium", size: 35))
            
            Image(ImageResource.cronograma)
                .padding(.leading,20)
        }
        .padding()
    }
}

#Preview {
    SleepSessionView()
}
