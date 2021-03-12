//
//  TreeApp.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/11/21.
//

import SwiftUI

struct TreeApp: App {
    
@StateObject var placeSettings = PlacementSettings()
    
    var body: some Scene {
        
        WindowGroup {
            
            CView()
                .environmentObject(placeSettings)
        }
    }
}
