//
//  model.swift
//  Holiday App
//
//  Created by Jenya Lebid on 1/26/21.
//

import UIKit
import RealityKit
import Combine

class Model {
    
    var modelName: String
    var image: UIImage?
    var modelEntity: ModelEntity?
    
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)
        
        let fileName = modelName + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            
            .sink(receiveCompletion: { loadCompletion in
            
            print("Unable to load Entity")
            
        }, receiveValue: { modelEntity in
            
            self.modelEntity = modelEntity
            
            print("Load the model Good")
        })
    }
}
