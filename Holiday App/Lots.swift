//
//  Lots.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/5/20.
//

import Foundation

struct Lots: Codable {
    
    var lotID = Int()
    var lotName = String()
    var lotTreeTypes = [Int]()
    var lotDiscount = String()
    var lotDiscountNote = String()
    var lotLatCoord = Double()
    var lotLongCoord = Double()
}
