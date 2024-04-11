//
//  MusicView.swift
//  MedicMeditationApp
//
//  Created by Ronaldo Andre on 3/04/24.
//

import SwiftUI

struct MusicView: View {
    
    @State var isActiveReproductor: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image(ImageResource.cardRelax)
                
                VStack(alignment: .leading) {
                    Text("Relax Sounds")
                        .font(.custom("AlegreyaSans-Medium", size: 27))
                        .foregroundColor(Color.white)
                    Text("Sometimes the most productive")
                        .font(.custom("AlegreyaSans-Medium", size: 15))
                        .foregroundColor(Color.white)
                    Text("thing you can do is relax.")
                        .font(.custom("AlegreyaSans-Medium", size: 15))
                        .foregroundColor(Color.white)
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("play now")
                            Image(ImageResource.playBlack)
                        }
                        .font(.custom("AlegreyaSans-Medium", size: 15))
                        .padding(.all, 15)
                        .foregroundStyle(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                    })
                }
                .padding(.trailing,80)
            }
            ScrollView   {
                Button(action: {
                    isActiveReproductor = true
                }, label: {
                    HStack(spacing:80) {
                        HStack(spacing: 20) {
                            Image(ImageResource.paintingForest)
                            
                            VStack(alignment: .leading) {
                                Text("Painting Forest")
                                    .font(.custom("AlegreyaSans-Medium", size: 20))

                                Text("59899 Listening")
                                    .font(.custom("AlegreyaSans-Light", size: 12))
                            }
                        }
                        Text("20 Min")
                            .font(.custom("AlegreyaSans-Medium", size: 15))
                    }
                })
                .foregroundColor(Color.black)
                
                HStack(spacing:80) {
                    HStack(spacing: 20) {
                        Image(ImageResource.paintingForest)
                        
                        VStack(alignment: .leading) {
                            Text("Painting Forest")
                                .font(.custom("AlegreyaSans-Medium", size: 20))

                            Text("59899 Listening")
                                .font(.custom("AlegreyaSans-Light", size: 12))
                        }
                    }
                    Text("20 Min")
                        .font(.custom("AlegreyaSans-Medium", size: 15))
                }
                
                
                HStack(spacing:80) {
                    HStack(spacing: 20) {
                        Image(ImageResource.paintingForest)
                        
                        VStack(alignment: .leading) {
                            Text("Painting Forest")
                                .font(.custom("AlegreyaSans-Medium", size: 20))

                            Text("59899 Listening")
                                .font(.custom("AlegreyaSans-Light", size: 12))
                        }
                    }
                    Text("20 Min")
                        .font(.custom("AlegreyaSans-Medium", size: 15))
                }
                
                HStack(spacing:80) {
                    HStack(spacing: 20) {
                        Image(ImageResource.paintingForest)
                        
                        VStack(alignment: .leading) {
                            Text("Painting Forest")
                                .font(.custom("AlegreyaSans-Medium", size: 20))

                            Text("59899 Listening")
                                .font(.custom("AlegreyaSans-Light", size: 12))
                        }
                    }
                    Text("20 Min")
                        .font(.custom("AlegreyaSans-Medium", size: 15))
                }
            }
            .padding(.top,20)
           
        }
        .padding()
        .navigation(ReproductorView(), $isActiveReproductor)
    }
}

#Preview {
    MusicView()
}
