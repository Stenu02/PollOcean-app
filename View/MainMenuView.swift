//
//  MainMenuView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 11/11/24.
//

import SwiftUI

struct MainMenuView: View {
    @State private var isGameActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image for the main menu
                Image("MainMenu")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Button(action: {
                        isGameActive = true
                    }) {
                        Text("Play")
                            .font(.custom("Kodchasan-Bold", size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#00517F"))
                            .padding(70)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(hex: "#B3E8F4"), Color(hex:"#00A2FF"), Color(hex: "#004064")]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color(hex: "#00517F"), lineWidth: 11)
                            )
                            .cornerRadius(35)
                    }
                    .padding(.horizontal, 40)
                    
                    NavigationLink(destination: JournalView()) {
                        Text("Journal")
                            .font(.custom("Kodchasan-Bold", size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#00517F"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color(hex: "#B3E8F4"), Color(hex:"#00A2FF"), Color(hex: "#004064")]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(hex: "#00517F"), lineWidth: 11)
                            )
                            .cornerRadius(25)
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                }
                .padding(.top, 300)
            }
        
            .fullScreenCover(isPresented: $isGameActive) {
                Game(isGameActive: $isGameActive)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
