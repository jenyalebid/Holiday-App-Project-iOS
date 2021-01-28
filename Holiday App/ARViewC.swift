//
//  ViewController.swift
//  AR
//
//  Created by Jenya Lebid on 1/27/21.
//

import UIKit
import RealityKit

class ARViewC: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var anchor:Exp.Box!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Load the "Box" scene from the "Experience" Reality File
        anchor = try! Exp.loadBox()
        anchor.generateCollisionShapes(recursive: true)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(anchor)
    }
    
    
    @IBAction func placeClick(_ sender: Any) {
        
        anchor.notifications.scale.post()
        
    }
}
