//
//  Garbage.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import Foundation
 
struct Garbage: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var type: String
    
    var description: String
    var image: String
    
    var imagetype: String
}
