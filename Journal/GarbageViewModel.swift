//
//  GarbageViewModel.swift
//  Fishing
//
//  Created by Simone Di Blasi on 12/11/24.
//

import Foundation

@Observable
class GarbageViewModel  {
    
    var garbage = [
        Garbage(name: "Spray Bottle", type: "High-Density Polyethylene", description: "Plastic bottles can take up to 250 years to decompose.Years ago, the global HDPE market reached a volume of more than 30 million tons.HDPE is commonly recycled, and has the number ,“2” as its identification code.", image: "SprrayBottle", imagetype: "HDPE" ),
        Garbage(name: "Straw", type: "Thermoplastic polymer polypropylene", description: "Plastic straws can take up to 200 years to decompose.Years ago, around 500 million plastic straws were used globally each day. PP is commonly recyclable, has the number “5” as its identification code.", image: "Straw 1", imagetype: "PP"),
        Garbage(name: "Glass Bottle", type: "Sand, Limestone and Recycled cullet", description: "Glass does not decompose and takes thousands of years to break down.No glass bottle has significantly decomposed yet. GL is fully recyclable, it identification number is 71.", image: "Glass1 1", imagetype: "GL")
    ]
        
}
