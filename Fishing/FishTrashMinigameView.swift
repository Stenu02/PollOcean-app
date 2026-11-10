//
//  FishTrashMinigameView.swift
//  Fishing
//
//  Created by Stefano Nuzzo on 07/11/24.
//

import SwiftUI

struct FishTrashMinigameView: View {
    @State private var imagePosition: CGPoint = .zero
    @State private var dragOffset: CGSize = .zero
    @State private var isFish: Bool = Bool.random() // Randomly determine if it's a fish or trash
    @State private var currentImage: Image = Image("fish1") // Default image to start
    @State private var scoreUpdated = false // To track if score has been updated
    let onSwipeComplete: (Bool) -> Void
    
    // Set of fish images
    let fishImages = ["FLyingFish", "Octo", "Butterfly", "Clown","Turtle","FishL"]
    
    // Set of trash images
    let trashImages = ["PlasticBottle", "Glass2", "Glass3", "Glass4","SprayBottle","PlasticBottles"]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Display the image (either fish or trash)
                currentImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .position(imagePosition == .zero ? CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2) : imagePosition)
                    .offset(dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Update the drag position of the image
                                dragOffset = value.translation
                            }
                            .onEnded { value in
                                // Check swipe direction and update score accordingly
                                if value.translation.height < 0 { // Swipe Up
                                    if isFish {
                                        onSwipeComplete(true) // Correct swipe, increase score
                                    } else {
                                        onSwipeComplete(false) // Incorrect swipe, lose a life
                                    }
                                } else { // Swipe Down
                                    if isFish {
                                        onSwipeComplete(false) // Incorrect swipe, lose a life
                                    } else {
                                        onSwipeComplete(true) // Correct swipe, increase score
                                    }
                                }
                                
                                // Reset position and disable further dragging until next image
                                imagePosition = .zero
                                dragOffset = .zero
                            }
                    )
            }
            .onAppear {
                // Select a random image from either fish or trash sets
                if isFish {
                    currentImage = Image(fishImages.randomElement() ?? "fish1")
                } else {
                    currentImage = Image(trashImages.randomElement() ?? "trash1")
                }
                
                // Position the image at the center of the screen initially
                imagePosition = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}
