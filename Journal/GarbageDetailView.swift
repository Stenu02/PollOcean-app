//
//  GarbageDetailView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import SwiftUI

struct GarbageDetailView: View {
    var garbage: Garbage
    var body: some View {
        ZStack {
            Image("JournalSG")
                .resizable()
                .ignoresSafeArea()
            Image("JournalCardG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading)
            Image(garbage.image)
                .resizable()
                .frame(width:130 , height: 200)
                .padding(.top, -380)
               
            
           
            
            Image(garbage.imagetype)
                .resizable()
                .frame(width:90 , height:90)
                .padding(.top, 450)
            
            VStack{
                Text(garbage.name)
                    .font(.title)
                    .padding(.top, -60)
                    .bold()
                    .foregroundStyle(Color(hex: "#00517F"))
                
                Image("Line")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:70 , height:10)
                
                    .padding(.leading, -5)
                    .padding(.top,-40)
                
                Text(garbage.type)
                    .padding(.top, -40)
                    .foregroundStyle(Color(hex: "#00517F"))
                
                Text(garbage.description)
                    .frame(width:300 )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(hex: "#00517F"))
                    .padding(.bottom, -30)
                    .font(.custom("Kodchasan-Bold", size: 20))
            }
            
        }
    }
}



#Preview {
    GarbageDetailView(garbage: .init(name: "ciao", type: "ciao", description: "Plastic bottles can take up to 250 years to decompose. Years ago, the global HDPE market reached a volume of more than 30 million tons. HDPE is commonly recycled, and has the number 2 as its identification code.", image: "Glass1 1", imagetype: "HDPE"))
}
