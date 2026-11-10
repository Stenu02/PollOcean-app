//
//  QuickEvent.swift
//  Fishing
//
//  Created by Stefano Nuzzo on 06/11/24.
//

import SwiftUI

struct QuickEventView: View {
    let pathType: PathType
    let onComplete: () -> Void
    @State private var ballPosition: CGPoint = .zero
    @State private var dragOffset: CGSize = .zero
    @State private var reachedEnd = false // Flag che indica se la pallina ha raggiunto la fine del percorso

    var body: some View {
        GeometryReader { geometry in
            // Generiamo il percorso e i punti estremi
            let (path, endPoint) = PathGenerator.generatePath(for: pathType, in: geometry.frame(in: .local))
            let startPoint = getStartPoint(for: pathType, in: geometry.frame(in: .local)) // Punto di inizio (estremo opposto al fine)
            
            ZStack {
                // Disegniamo il percorso
                path.stroke(Color(red: 255/255, green: 93/255, blue: 0/255), lineWidth: 30)
                
                // Pallina
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    .position(ballPosition == .zero ? startPoint : ballPosition) // Imposta la posizione iniziale
                    .offset(dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Calcola la nuova posizione della pallina
                                let potentialPosition = CGPoint(x: ballPosition.x + value.translation.width, y: ballPosition.y + value.translation.height)
                                
                                // Controlla se la pallina è all'interno del percorso
                                if isPositionWithinPath(potentialPosition, in: path, lineWidth: 30) {
                                    dragOffset = CGSize(width: value.translation.width, height: value.translation.height)
                                }
                            }
                            .onEnded { _ in
                                // Aggiusta la posizione finale della pallina
                                let newBallPosition = CGPoint(x: ballPosition.x + dragOffset.width, y: ballPosition.y + dragOffset.height)
                                
                                // Controlla se la pallina è arrivata al punto finale
                                if isPositionCloseToEnd(newBallPosition, endPoint: endPoint) {
                                    reachedEnd = true
                                    onComplete() // Chiama il callback per chiudere il mini-gioco
                                }
                                
                                ballPosition = newBallPosition
                                dragOffset = .zero
                            }
                    )
            }
            .onAppear {
                // Imposta la pallina al punto di inizio del percorso
                ballPosition = startPoint
            }
        }
    }

    // Funzione per determinare il punto di inizio del percorso
    private func getStartPoint(for pathType: PathType, in rect: CGRect) -> CGPoint {
        switch pathType {
        case .circular:
            return CGPoint(x: rect.minX + 40, y: rect.midY) // Punto sinistro per il cerchio
        case .square:
            return CGPoint(x: rect.minX + 40, y: rect.minY + 40) // Angolo in alto a sinistra
        case .arc:
            return CGPoint(x: rect.minX + 40, y: rect.midY) // Punto iniziale dell'arco
        case .sShape:
            return CGPoint(x: rect.minX + 40, y: rect.midY) // Punto iniziale della "S"
        case .zigZag:
            return CGPoint(x: rect.minX + 40, y: rect.midY) // Punto iniziale dello zig-zag
        }
    }
    
    // Funzione per verificare se la pallina è all'interno del percorso
    private func isPositionWithinPath(_ position: CGPoint, in path: Path, lineWidth: CGFloat) -> Bool {
        let strokedPath = path.strokedPath(.init(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        return strokedPath.contains(position)
    }

    // Funzione per verificare se la pallina è vicina al punto finale
    private func isPositionCloseToEnd(_ position: CGPoint, endPoint: CGPoint) -> Bool {
        let tolerance: CGFloat = 20 // Tolleranza per considerare il completamento
        return abs(position.x - endPoint.x) < tolerance && abs(position.y - endPoint.y) < tolerance
    }
}

