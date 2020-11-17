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
    //var lotWebsite = String()
    //var lotTwitter = String()
    //var lotFacebook = String()
    var lotLogo = String()
    var lotTreeTypes = [Int]()
    var lotDiscount = String()
    var lotDiscountShow = String()
    var lotDiscountNote = String()
    var lotDisclamerNote = String()
    var lotLatCoord = Double()
    var lotLongCoord = Double()
}
