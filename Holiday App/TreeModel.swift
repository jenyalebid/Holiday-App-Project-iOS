//
//  TreeModel.swift
//  Holiday App
//
//  Created by Jenya Lebid on 3/11/21.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCat: CaseIterable {
    
    case tree

    var label: String {
        
        get {
            
            switch self {
            case .tree:
                return "Trees"
            }
        }
    }
}

class TreeModel {
    
    var name: String
    var category: ModelCat
    var thumb: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCat, scaleComp: Float = 1.0) {
        
        self.name = name
        self.category = category
        self.thumb = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleComp
    }
    
    //Async
    
    func asyncLoadModelEntity() {
        
        let filename = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {
                
                loadCmpletion in
                
                switch loadCmpletion {
                case .failure(let error): print("Unable to load file name for \(filename). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: {
                
                modelEntity in
                
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
                
                print("model entity for \(self.name) loaded.")
                
            })
    }
}

struct TreeModels {
    
    var all: [TreeModel] = []
    
    init() {
        
        let tree1 = TreeModel(name: "tree1", category: .tree, scaleComp: 0.80/100)
        let tree2 = TreeModel(name: "tree2", category: .tree, scaleComp: 0.80/10)
        
        self.all += [tree1, tree2]
    }
    
    func get(category: ModelCat) -> [TreeModel] {
        
        return all.filter({$0.category == category})
    }
}
