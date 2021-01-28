//
//  ViewController.swift
//  AR
//
//  Created by Jenya Lebid on 1/27/21.
//




import UIKit
import ARKit
import RealityKit
//import FocusEntity

class ARViewC: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var anchor: TreeScene.Tree!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let focusSquare = FocusEntity(on: self.arView, style: .classic(color: .red))
        
        // Load the "Box" scene from the "Experience" Reality File
        anchor = try! TreeScene.loadTree()
        anchor.generateCollisionShapes(recursive: true)


        // Add the box anchor to the scene
//        arView.scene.anchors.append(focusSquare)
        
        
    }


    @IBAction func placeClick(_ sender: Any) {

        arView.scene.anchors.append(anchor)
        anchor.notifications.place.post()


    }
    
    @IBAction func scaleUp(_ sender: Any) {
        
        print("scale")
        anchor.notifications.scaleUp.post()
    }
    
    @IBAction func scaleDown(_ sender: Any) {
        
        anchor.notifications.scaleDown.post()
    }
    
    
    
}


