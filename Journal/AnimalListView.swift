//
//  AnimalListView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//
import SwiftUI

struct AnimalListView: View {
    
    var animalData = AnimalViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("JournalSA")
                    .resizable()
                    .ignoresSafeArea()

                // List of animals
                List {
                    ForEach(animalData.animal) { animal in
                        NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            HStack {
                                
                                Image(animal.image)
                                    .resizable()
                                    .frame(width: 55, height: 50)
                                    .padding(.leading,15)
                                    .padding(0)

                                Text(animal.name)
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
                .scrollContentBackground(.hidden)
            }
        }
    }
}

#Preview {
    AnimalListView()
}

// Hex Color Extension
extension Color {
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexSanitized)
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)
        self.init(
            .sRGB,
            red: Double((hexNumber & 0xFF0000) >> 16) / 255.0,
            green: Double((hexNumber & 0x00FF00) >> 8) / 255.0,
            blue: Double(hexNumber & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}
