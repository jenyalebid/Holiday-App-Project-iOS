//
//  ViewController.swift
//  AR
//
//  Created by Jenya Lebid on 1/27/21.
//




import UIKit
import ARKit
import RealityKit
import FocusEntity

class ARViewC: UIViewController {
    
    
    var treePlaced = false
    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var placeButton: UIButton!
    @IBOutlet weak var upButton: UIImageView!
    @IBOutlet weak var downButton: UIImageView!
    @IBOutlet weak var treeHLabel: UILabel!
    @IBOutlet weak var treeWLabel: UILabel!
    
    var treeHeight = Double()
    var treeWidth = Double()
    
    var anchor: TreeScene.Tree!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Load the "Box" scene from the "Experience" Reality File

        let focusSquare = FocusEntity(on: self.arView, style: .classic(color: .red))
        arView.scene.anchors.append(focusSquare)
        
        anchor = try! TreeScene.loadTree()

        //anchor.generateCollisionShapes(recursive: true)
        //anchor.generateCollisionShapes(recursive: true)



        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        

        
        treeHLabel.text = "\(treeHeight.rounded(toPlaces: 2)) Feet"
        treeWLabel.text = "\(treeWidth.rounded(toPlaces: 2)) Feet"
        
//        if !treePlaced {
//
//
//            upButton.isHidden = true
//            downButton.isHidden = true
//        }
//        else {
//
//            arView.scene.anchors.remove(focusSquare)
//
//            upButton.isHidden = false
//            downButton.isHidden = false
//        }
        
    }


    @IBAction func placeClick(_ sender: Any) {

        if !treePlaced {
            print ("HEY")
            
            placeButton.setTitle("Remove Tree", for: .normal)
            //upButton.isHidden = false
            //downButton.isHidden = false
            
            anchor = try! TreeScene.loadTree()
            //anchor.notifications.place.post()
            arView.scene.addAnchor(anchor)
            treePlaced = true
            
            treeHeight = 3.81
            treeWidth = 1.4
            
            
            //treeHLabel.text = "\(treeHeight.rounded(toPlaces: 2)) Feet"
            viewDidAppear(true)
            
        }
        
        else {
            
            placeButton.setTitle("Place Tree", for: .normal)
            //upButton.isHidden = true
            //downButton.isHidden = true
            
            arView.scene.removeAnchor(anchor)
            treePlaced = false
        }
        
        

        
        


    }
    
    @IBAction func scaleUp(_ sender: Any) {
        
        print("scale")
        anchor.notifications.scaleUp.post()
        
        treeHeight = treeHeight * 1.10
        treeWidth = treeWidth * 1.10
        viewDidAppear(true)
    }
    
    @IBAction func scaleDown(_ sender: Any) {
        
        anchor.notifications.scaleDown.post()
        
        treeHeight = treeHeight * 0.91
        treeWidth = treeWidth * 0.91
        viewDidAppear(true)
    }
    
    
    
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


