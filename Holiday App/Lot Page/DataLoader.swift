//
//  DataLoader.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/5/20.
//

import Foundation

public class DataLoader {
    
    @Published var treeData = [Trees]()
    @Published var lotData = [Lots]()
    
    init() {
        
        loadTrees()
        loadLots()
        sort()
    }
    
    func loadTrees() {
        
        if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                
                let dataFromJason = try jsonDecoder.decode([Trees].self, from: data)
                
                self.treeData = dataFromJason
                
            } catch {
                
                print(error)
            }
        }
    }
    
    func loadLots() {
        
        if let file = Bundle.main.url(forResource: "lots", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                
                let dataFromJason = try jsonDecoder.decode([Lots].self, from: data)
                
                self.lotData = dataFromJason
                
            } catch {
                
                print(error)
            }
        }
    }
    
    func sort() {
        
        self.treeData = self.treeData.sorted(by: {$0.treeID < $1.treeID})
        self.lotData = self.lotData.sorted(by: {$0.lotID < $1.lotID})
    }
    
}
