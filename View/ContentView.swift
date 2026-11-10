//
//  ContentView.swift
//  Fishing
//
//  Created by Simone Di Blasi on 04/11/24.
//

import SwiftUI
import AVKit

struct Game: View {
    @State private var shadowPosition: CGPoint = .zero
    @State private var showShadow: Bool = false
    @State private var showQuickEvent = false
    @State private var showFishTrashImage = false
    @State private var currentPathType: PathType = .circular
    @State private var score = 0
    @State private var lives = 3
    @State private var isGameOver = false // Tracks game-over state
    @State private var canSelectShadow = true
    @State private var dragOffset: CGSize = .zero
    @State private var isQuickEventActive = false
    @Binding var isGameActive: Bool
    var videoPlayerView = VideoPlayerView(videoName: "Video")

    var body: some View {
        ZStack {
            videoPlayerView
                           .ignoresSafeArea()
                           .onAppear {
                               videoPlayerView.playVideo()
                           }
                           .onDisappear {
                               videoPlayerView.stopVideo()
                           }
            
            if showQuickEvent {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
            
            VStack {
                HStack {
                    HStack(spacing: 5) {
                        ForEach(0..<lives, id: \.self) { _ in
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .font(.title)
                        }
                        ForEach(lives..<3, id: \.self) { _ in
                            Image(systemName: "heart")
                                .foregroundColor(.red.opacity(0.3))
                                .font(.title)
                        }
                    }
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundStyle(Color(hex: "#00517F"))
                        .font(.title)
                        .bold()
                        .padding()
                }
                .padding(.horizontal)
                
                Spacer()
                
                if showQuickEvent {
                    ZStack {
                        Color.clear
                        QuickEventView(pathType: currentPathType, onComplete: endQuickEvent)
                            .frame(width: 300, height: 300)
                            .shadow(radius: 10)
                            .cornerRadius(20)
                            .transition(.scale)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                } else if showFishTrashImage {
                    FishTrashMinigameView(onSwipeComplete: handleSwipe)
                }
                
                Spacer()
            }
            
            if showShadow && canSelectShadow && !isQuickEventActive && !isGameOver {
                Circle()
                    .fill(Color.black.opacity(0.5))
                    .frame(width: 50, height: 50)
                    .position(shadowPosition)
                    .onTapGesture {
                        startQuickEvent()
                    }
            }
            
            if isGameOver {
                           GameOverView(score: score, onRestart: restartGame, onBackToMenu: {
                               isGameActive = false
                           })
                           .transition(.opacity)
                       }
                   }
                   .onAppear {
                       generateNewShadowPosition()
                       videoPlayerView.playVideo()
                   }
               }

    private func generateNewShadowPosition() {
       
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let shadowAreaWidth: CGFloat = screenWidth * 0.8
        let shadowAreaHeight: CGFloat = screenHeight * 0.4
        let shadowAreaX: CGFloat = (screenWidth - shadowAreaWidth) / 2
        let shadowAreaY: CGFloat = (screenHeight - shadowAreaHeight) / 2
        
        let randomX = CGFloat.random(in: shadowAreaX...(shadowAreaX + shadowAreaWidth))
        let randomY = CGFloat.random(in: shadowAreaY...(shadowAreaY + shadowAreaHeight))
        
        shadowPosition = CGPoint(x: randomX, y: randomY)
        
        showShadow = true
    }
    
    private func startQuickEvent() {
        isQuickEventActive = true
        currentPathType = randomPathType()
        showQuickEvent = true
        showShadow = false
        generateNewShadowPosition()
    }
    
    private func endQuickEvent() {
        isQuickEventActive = false
        showQuickEvent = false
        showFishTrashImage = true
        canSelectShadow = false
    }

    private func handleSwipe(isCorrect: Bool) {
        if isCorrect {
            score += 1
        } else {
            lives -= 1
            if lives <= 0 {
                isGameOver = true
            }
        }
        
        showFishTrashImage = false
        showShadow = true
        canSelectShadow = true
    }
    
    private func randomPathType() -> PathType {
        let pathTypes: [PathType] = [.circular, .square, .arc, .sShape, .zigZag]
        return pathTypes.randomElement() ?? .circular
    }
    
    private func restartGame() {
        score = 0
        lives = 3
        isGameOver = false
        showShadow = true
        canSelectShadow = true
        videoPlayerView.playVideo() 
    }
}

struct GameOverView: View {
    let score: Int
    let onRestart: () -> Void
    let onBackToMenu: () -> Void

    var body: some View {
        VStack {
            Text("Game Over")
                .font(.custom("Kodchasan-Bold", size: 30))
                .foregroundColor(.white)
                .padding(-10)
            Text("Score: \(score)")
                .font(.custom("Kodchasan-Bold", size: 25))
                .foregroundColor(.white)
                .padding()
            
            // Restart button
            Button("Restart") {
                onRestart()
            }
            .font(.custom("Kodchasan-Bold", size: 30))
            .fontWeight(.bold)
            .foregroundColor(Color(hex: "#00517F"))
            .padding(10)
            .frame(width:200 , height: 150)
            
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
            
 
            Button("Menu") {
                onBackToMenu()
            }
            .font(.custom("Kodchasan-Bold", size: 30))
            .fontWeight(.bold)
            .foregroundColor(Color(hex: "#00517F"))
            .padding(10)
            .frame(width:200 , height: 80)
            
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
        .padding()
        .background(Color.black.opacity(0.8))
        .cornerRadius(20)
    }
}



struct VideoPlayerView: UIViewRepresentable {
    var videoName: String
    private let player: AVPlayer

    init(videoName: String) {
        self.videoName = videoName
        if let path = Bundle.main.path(forResource: videoName, ofType: "mov") {
            self.player = AVPlayer(url: URL(fileURLWithPath: path))
        } else {
            self.player = AVPlayer()
            print("Video not found")
        }
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = view.bounds
        view.layer.addSublayer(playerLayer)
        
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: .zero)
            player.play()
        }
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            if let playerLayer = uiView.layer.sublayers?.first as? AVPlayerLayer {
                playerLayer.frame = uiView.bounds
            }
        }
    }

    func playVideo() {
        player.seek(to: .zero)
        player.play()
    }

    func stopVideo() {
        player.pause()
    }
}



