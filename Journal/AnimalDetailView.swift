//
//  AnimalDetailView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import SwiftUI


struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ZStack {
            Image("JournalSA")
                .resizable()
                .ignoresSafeArea()
            Image("JournalCardA")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(animal.image)
                .resizable()
                .frame(width:220 , height: 200)
                .padding(.top, -380)
          
            
            Image(animal.imagetype)
                .padding(.top, 450)

            VStack{
                Text(animal.name)
                    .font(.title)
                    .padding(.top, -70)
                    .bold()
                    .foregroundStyle(Color(hex: "#00517F"))
                Image("Line")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:70 , height:10)
                
                    .padding(.leading, -5)
                    .padding(.top,-55)
                
                Text(animal.type)
                    .padding(.top,-50)
                    .foregroundStyle(Color(hex: "#00517F"))
                
                Text(animal.description)
                
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
    AnimalDetailView(animal: .init(name: "ciao", type: "ciao", description: "The Pharaoh flyingfish has a sleek body, large wing-like fins for gliding, and a forked tail for propulsion.The Pharaoh flyingfish is impacted by sea pollution.Microplastics can cause malnutrition and reproductive issues.", image: "Octo", imagetype: "SilhuetteO"))
}
