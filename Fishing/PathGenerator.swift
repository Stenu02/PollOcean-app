//
//  PathGenerator.swift
//  Fishing
//
//  Created by Stefano Nuzzo on 06/11/24.
//

import SwiftUI

enum PathType {
    case circular, square, arc, sShape, zigZag
}

struct PathGenerator {
    static func generatePath(for type: PathType, in rect: CGRect) -> (Path, CGPoint) {
        switch type {
        case .circular:
            let radius = min(rect.width, rect.height) / 2 - 40
            let startPoint = CGPoint(x: rect.midX - radius, y: rect.midY)  // Inizio del percorso
            
            return (Path { path in
                // Disegniamo una parte di arco, non un cerchio chiuso
                path.move(to: startPoint)
                path.addLine(to: CGPoint(x: rect.midX + radius, y: rect.midY)) // Un segmento orizzontale
            }, CGPoint(x: rect.midX + radius, y: rect.midY)) // Punto finale del percorso

        case .square:
            let side = min(rect.width, rect.height) - 80
            let startPoint = CGPoint(x: rect.midX - side / 2, y: rect.midY - side / 2)  // Inizio del percorso

            return (Path { path in
                // Disegniamo tre lati del quadrato
                path.move(to: startPoint)
                path.addLine(to: CGPoint(x: rect.midX + side / 2, y: rect.midY - side / 2)) // Lato superiore
                path.addLine(to: CGPoint(x: rect.midX + side / 2, y: rect.midY + side / 2)) // Lato destro
                path.addLine(to: CGPoint(x: rect.midX - side / 2, y: rect.midY + side / 2)) // Lato inferiore
            }, CGPoint(x: rect.midX - side / 2, y: rect.midY + side / 2)) // Punto finale

        case .arc:
            let startPoint = CGPoint(x: rect.minX + 40, y: rect.midY)
            let endPoint = CGPoint(x: rect.maxX - 40, y: rect.midY)
            
            return (Path { path in
                path.move(to: startPoint)
                path.addQuadCurve(to: endPoint, control: CGPoint(x: rect.midX, y: rect.minY + 100)) // Curva ad arco
            }, endPoint) // Punto finale

        case .sShape:
            let startPoint = CGPoint(x: rect.minX + 40, y: rect.midY)
            let middlePoint = CGPoint(x: rect.midX, y: rect.midY + 100)
            let endPoint = CGPoint(x: rect.maxX - 40, y: rect.midY)
            
            return (Path { path in
                path.move(to: startPoint)
                path.addQuadCurve(to: middlePoint, control: CGPoint(x: rect.midX, y: rect.minY + 50)) // Prima curva
                path.addQuadCurve(to: endPoint, control: CGPoint(x: rect.midX, y: rect.maxY - 50)) // Seconda curva
            }, endPoint) // Punto finale

        case .zigZag:
            let startPoint = CGPoint(x: rect.minX + 40, y: rect.midY)
            let endPoint = CGPoint(x: rect.maxX - 40, y: rect.midY)
            
            return (Path { path in
                path.move(to: startPoint)
                
                // Prima discesa
                path.addLine(to: CGPoint(x: rect.midX - 60, y: rect.midY - 100)) // Angolo superiore sinistro
                // Picco centrale
                path.addLine(to: CGPoint(x: rect.midX, y: rect.midY)) // Picco centrale
                // Seconda discesa
                path.addLine(to: CGPoint(x: rect.midX + 60, y: rect.midY - 100)) // Angolo superiore destro
                // Fine del percorso
                path.addLine(to: endPoint)
            }, endPoint) // Punto finale
        }
    }
}

