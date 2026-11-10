//
//  GarbageListView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import SwiftUI

struct GarbageListView: View {
    
    var garbageData = GarbageViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("JournalSG")
                    .resizable()
                    .ignoresSafeArea()

                // List of animals
                List {
                    ForEach(garbageData.garbage) { garbage in
                        NavigationLink(destination: GarbageDetailView(garbage: garbage)) {
                            HStack {
                                Image(garbage.image)
                                    .resizable()
                                    .frame(width: 30, height: 50)
                                    .padding(.leading,15)
                                    .padding(0)

                             
                                Text(garbage.name)
                                    .font(.custom("Kodchasan-Bold", size: 20))
                                    .foregroundStyle(Color(hex: "#00517F"))
                                    .bold()
                                    .padding(.leading, 2)
                            }

                        }
                        .listRowBackground(Color.clear)
                        .padding(.vertical, 5)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "#F8E9D5"), Color(hex: "#CDEEAB")]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(hex: "#00517F"), lineWidth: 5)
                        )
                    }
                }
                .scrollContentBackground(.hidden)             }
        }
    }
}

#Preview {
    GarbageListView()
}


