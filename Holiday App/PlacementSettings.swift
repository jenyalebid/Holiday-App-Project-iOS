//
//  PlacementSettings.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/11/21.
//

import SwiftUI
import RealityKit
import Combine

class PlacementSettings: ObservableObject {
    
    @Published var selectModel: TreeModel? {
        
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    
    @Published var confirmedModel: TreeModel? {
        
        willSet(newValue) {
            
            guard let model = newValue else {
                
                print("Clearing Confirmed Model")
                return
            }
            
            print("Setting Confirmed to \(model.name)")
        }
    }
    
    var sceneObserver: Cancellable?
}
