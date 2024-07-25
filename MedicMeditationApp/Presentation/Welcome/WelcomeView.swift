//
//  WelcomeView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var isActiveMeditation: Bool = false
    @State var isActiveSleepSession: Bool = false
    
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
            
            VStack(spacing: 50) {
                WelcomeCard(
                    onClickInSitioWeb: {
                        isActiveMeditation = true
                    },
                    tituloDeCard: "Meditation 101",
                    subtituloCardPrimer: "Techniques, Benefits, and",
                    subtituloCardSegund: "a Beginners How-To",
                    textoDelButton: "watch now",
                    imagenDeCard: ImageResource.meditation101
                )
                
                WelcomeCard(
                    onClickInSitioWeb: {
                        isActiveSleepSession = true
                    },
                    tituloDeCard: "Cardio Meditation",
                    subtituloCardPrimer: "Basics of Yoga for Beginners",
                    subtituloCardSegund: "or Experienced Professionals",
                    textoDelButton: "watch now",
                    imagenDeCard: ImageResource.cardioMeditation
                )
            }
            .padding(.top,30)
            .padding(.bottom,100)

        }
        .padding()
        .navigation(MeditationView(), $isActiveMeditation)
        .navigation(SleepSessionView(), $isActiveSleepSession)
    }
}

#Preview {
    WelcomeView()
}
