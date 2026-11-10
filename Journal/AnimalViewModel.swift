//
//  AnimalViewModel.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import Foundation

@Observable
class AnimalViewModel {
    
    var animal = [
        Animal(name: "Pharao Flyingfish", type: "Fish", description: "The Pharaoh flyingfish has a sleek body, large wing-like fins for gliding, and a forked tail for propulsion.The Pharaoh flyingfish is impacted by sea pollution.Microplastics can cause malnutrition and reproductive issues.", image: "FLayngFish", imagetype: "SilhouetteF" ),
        Animal(name: "Giant Pacific Octopus", type: "Octopus", description: "The Giant Pacific octopus is a large, intelligent creature known for its camouflage and varied diet. This octopus is sensitive to environmental changes, and pollution, especially plastics, negatively impacts its population.", image: "Octo 1", imagetype: "SilhuetteO"),
        Animal(name: "Green Sea Turtle", type: "Testudines", description: "The green sea turtle has a heart-shaped, olive shell with a pale underside, and thick, paddle-like flippers for swimming. Pollution, especially plastics and chemicals, harms the GST by causing injuries, disrupting digestion and reproduction.", image: "Turtle 1", imagetype: "SilhouetteT")
    ]
        
}


