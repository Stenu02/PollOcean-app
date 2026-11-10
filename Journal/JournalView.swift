//
//  JournalView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("JournalS")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
               
                VStack(spacing: 10) {
                    Spacer()
                    NavigationLink(destination: AnimalListView()) {
                        ZStack{
                            Image("JBottonA")
                                .resizable()
                                .scaledToFit()
                                .padding(-5)
                            Text("Animals")
                                .font(.custom("Kodchasan-Bold", size: 40))
                                .fontWeight(.bold)
                                .foregroundStyle(Color(hex: "#00517F"))
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    NavigationLink(destination: GarbageListView()) {
                        ZStack{
                            Image("JBottonG")
                                .resizable()
                                .scaledToFit()
                                .padding(-5)
                            Text("Garbage")
                                .font(.custom("Kodchasan-Bold", size: 39))
                                .fontWeight(.bold)
                                .foregroundStyle(Color(hex: "#00517F"))
                                .padding(70)
                                .frame(maxWidth: .infinity)
                                //.background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    Spacer()
                }
                .padding(.top, -10) 
            }
        }
    }
}

#Preview {
    JournalView()
}
