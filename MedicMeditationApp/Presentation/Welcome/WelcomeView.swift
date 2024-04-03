//
//  WelcomeView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome back, Afreen!")
                .font(.custom("AlegreyaSans-Medium", size: 30))
            Text("How are you feeling today?")
                .font(.custom("AlegreyaSans-Regular", size: 22))
            
            ScrollView (.horizontal){
                HStack(spacing: 30) {
                    VStack {
                        Button(action: {}, label: {
                            Image(ImageResource.calmIcon)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding()
                                .background(Color.backGroundTabs)
                                .cornerRadius(20)
                        })
                        
                        Text("Calm")
                            .font(.custom("AlegreyaSans-Regular", size: 12))
                        
                    }
                    
                    VStack {
                        Button(action: {}, label: {
                            Image(ImageResource.calmIcon)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding()
                                .background(Color.backGroundTabs)
                                .cornerRadius(20)
                        })
                        
                        Text("Calm")
                            .font(.custom("AlegreyaSans-Regular", size: 12))
                        
                    }
                    
                    VStack {
                        Button(action: {}, label: {
                            Image(ImageResource.calmIcon)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding()
                                .background(Color.backGroundTabs)
                                .cornerRadius(20)
                        })
                        
                        Text("Calm")
                            .font(.custom("AlegreyaSans-Regular", size: 12))
                        
                    }
                    
                    VStack {
                        Button(action: {}, label: {
                            Image(ImageResource.calmIcon)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding()
                                .background(Color.backGroundTabs)
                                .cornerRadius(20)
                        })
                        
                        Text("Calm")
                            .font(.custom("AlegreyaSans-Regular", size: 12))
                        
                    }
                    
                }
            }
            
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 339, height: 170)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                VStack(alignment: .leading) {
                    ZStack {
                        HStack{
                            VStack(alignment: .leading){
                                Text("Meditation 101")
                                    .font(.custom("AlegreyaSans-Medium", size: 25))

                                    .foregroundColor(Color.foreGroundTitle)
                                
                                Text("Techniques, Benefits, and")
                                    .font(.custom("AlegreyaSans-Medium", size: 15))
                                    .foregroundColor(Color.foreGroundCard)
                                
                                Text("a Beginners How-To")
                                    .font(.custom("AlegreyaSans-Medium", size: 15))
                                    .foregroundColor(Color.foreGroundCard)
                                
                                Button(action: {
                                    
                                }, label: {
                                    HStack {
                                        Text("watch now")
                                        Image(ImageResource.play)
                                    }
                                    .font(.custom("AlegreyaSans-Medium", size: 15))
                                    .padding(.all, 15)
                                    .foregroundStyle(.white)
                                    .background(Color.buttonBack)
                                    .cornerRadius(10)
                                })
                            }
                            Image(ImageResource.meditation101)
                        }
                        .padding(.bottom,40)
                    }
                }
                .padding(.top, 38)
                .frame(width: 339, height: 170)
                .background(Color.backGroundCard)
                .foregroundColor(Color.white)
                .cornerRadius(12)
            }
            .padding(.leading,10)
            
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing
                )
                .mask(RoundedRectangle(cornerRadius: 12))
                .frame(width: 339, height: 170)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)

                VStack(alignment: .leading) {
                    ZStack {
                        HStack{
                            VStack(alignment: .leading){
                                Text("Cardio Meditation")
                                    .font(.custom("AlegreyaSans-Medium", size: 25))

                                    .foregroundColor(Color.foreGroundTitle)
                                
                                Text("Basics of Yoga for Beginners")
                                    .font(.custom("AlegreyaSans-Medium", size: 15))
                                    .foregroundColor(Color.foreGroundCard)
                                
                                Text("or Experienced Professionals")
                                    .font(.custom("AlegreyaSans-Medium", size: 15))
                                    .foregroundColor(Color.foreGroundCard)
                                
                                Button(action: {
                                    
                                }, label: {
                                    HStack {
                                        Text("watch now")
                                        Image(ImageResource.play)
                                    }
                                    .font(.custom("AlegreyaSans-Medium", size: 15))
                                    .padding(.all, 15)
                                    .foregroundStyle(.white)
                                    .background(Color.buttonBack)
                                    .cornerRadius(10)
                                })
                            }
                            Image(ImageResource.cardioMeditation)
                        }
                        .padding(.bottom,40)
                    }
                }
                .padding(.top, 38)
                .frame(width: 339, height: 170)
                .background(Color.backGroundCard)
                .foregroundColor(Color.white)
                .cornerRadius(12)
            }
            .padding(.leading,10)
            
            
            
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}
