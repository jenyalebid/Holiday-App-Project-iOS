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
import AVFoundation


var TreeHeight = Double()
var TreeWidth = Double()

var LOADED = Bool()

class ARViewC: UIViewController, ARSCNViewDelegate {
    
    
    var treePlaced = false
    var scaleCount = 0.0

    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var treeHLabel: UILabel!
    @IBOutlet weak var treeWLabel: UILabel!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var goBut: UIImageView!
    @IBOutlet weak var shareBut: UIImageView!
    
    @IBOutlet weak var placeBar: UIImageView!
    @IBOutlet weak var scaleDown: UIImageView!
    @IBOutlet weak var scaleUp: UIImageView!
    @IBOutlet weak var shareView: UIView!
    
    @IBOutlet weak var addBut: UIButton!
    
    @IBOutlet weak var remBut: UIImageView!
    
    var clickSound = AVAudioPlayer()
    var sizeSound = AVAudioPlayer()
    
    
    var anchor: TreeScene.Tree!
    
    var focusSquare: FocusEntity!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Load the "Box" scene from the "Experience" Reality File

        focusSquare = FocusEntity(on: self.arView, style: .classic(color: .systemGreen))
        
        //if !LOADED {
            
        anchor = try! TreeScene.loadTree()
            //LOADED = true
        //}
        
        arView.scene.anchors.append(focusSquare)
        
        
        print("In LOAD")
        topBar.isHidden = true
        scaleDown.isHidden = true
        scaleUp.isHidden = true
        remBut.isHidden = true
        
        addBut.layer.cornerRadius = 10.0
        scaleUp.layer.cornerRadius = 10.0
        scaleDown.layer.cornerRadius = 10.0
        goBut.layer.cornerRadius = 10.0
        shareBut.layer.cornerRadius = 10.0
        remBut.layer.cornerRadius = 20.0
        
//        let anchor = AnchorEntity(.plane([.horizontal, .vertical],
//                         classification: [.wall, .table, .floor],
//                          minimumBounds: [0.375, 0.375]))
        
        let anchorr = AnchorEntity(.plane([.horizontal],
                                          classification: [.floor],
                                          minimumBounds: [0.375, 0.375]))
        arView.scene.addAnchor(anchorr)

        /* Here we create an anchor for detected planes with a minimum area of 37.5 cm2 */

        //anchor.addChild(try! TreeScene.loadTree())        // visualising a detected plane
        //arView.scene.anchors.append(anchor)
        
        //var valid: FocusEntityDelegate
        
        //valid = focusSquare.delegat
        scheduledTimerWithTimeInterval()
        
        
        
        do {
            
            clickSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "clickSound", ofType: "wav")!))
            clickSound.prepareToPlay()
            
            sizeSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sizeSound", ofType: "wav")!))
            sizeSound.prepareToPlay()
        }
        catch {
            
            print("Can't play audio")
        }
        
        //Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: Selector(("updateCounting")), userInfo: nil, repeats: true)

    
        //print(valid)
        
        //focusSquare.delegate = valid
        //anchor.generateCollisionShapes(recursive: true)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        

        

        
        

        
        
//        let anchorr = AnchorEntity(.plane([.horizontal],
//                         classification: [.floor],
//                          minimumBounds: [0.375, 0.375]))
//
//        /* Here we create an anchor for detected planes with a minimum area of 37.5 cm2 */
//        let plane = MeshResource.generatePlane(width: 0.375, depth: 0.375)
//
//        let planeEnt = ModelEntity(mesh: plane)
//        anchorr.addChild(planeEnt)        // visualising a detected plane
//        arView.scene.anchors.append(anchorr)
//
//
//        let arView = ARView(frame: .zero)
//
//        let anchor = AnchorEntity(.plane(.horizontal, classification: .floor, minimumBounds: [0.5, 0.5]))
//        anchor.name = "PlaneAnchor"
//
//        //arView.scene.anchors.append(anchor)
//
//        let containsOrNot = arView.scene.anchors.contains(where: {
//            $0.name == "PlaneAnchor"
//        })
//        print(containsOrNot)
//
//        print(arView.scene.anchors.count)
//        print(arView.scene.anchors.first?.anchor?.id)
        
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
    
    func resetTree() {
        
        treeHLabel.text = "\(TreeHeight.rounded(toPlaces: 1)) Ft. high"
        treeWLabel.text = "\(TreeWidth.rounded(toPlaces: 1)) Ft. wide"
        
        
        if !treePlaced {
            
            topBar.isHidden = true
            scaleDown.isHidden = true
            scaleUp.isHidden = true
            remBut.isHidden = true
            
            addBut.isHidden = false
            placeBar.isHidden = false
            focusSquare.isEnabled = true
        }
        else {
            
            topBar.isHidden = false
            scaleDown.isHidden = false
            scaleUp.isHidden = false
            remBut.isHidden = false
            
            addBut.isHidden = true
            placeBar.isHidden = true
            focusSquare.isEnabled = false
        }
        
        
        
    }

    @IBAction func buttonPlace(_ sender: Any) {
        
        clickSound.play()
        
        if !treePlaced {
            
            print ("Placing Tree")
            
            anchor = try! TreeScene.loadTree()
                        
            //anchor.notifications.place.post()
            arView.scene.addAnchor(anchor)
            //anchor.isEnabled = true
            
            treePlaced = true
            //scaleCount += 1
            
            TreeHeight = 3
            TreeWidth = 1
            
            //viewDidAppear(true)
            resetTree()
        }
        
        
    }
    
    @IBAction func buttonRemove(_ sender: Any) {
        
        
        if treePlaced {
            
            clickSound.play()
            
            print ("Removing Tree")
            
            arView.scene.removeAnchor(anchor)
            //anchor.isEnabled  = false
            treePlaced = false
            
            scaleCount = 0.0
            TreeHeight = 3
            TreeWidth = 1
            
            
            //viewDidAppear(true)
            resetTree()
        }
        
    }
    
    @IBAction func accept(_ sender: Any) {
        
        clickSound.play()
        
        //buttonRemove(self)
        //buttonRemove(self)
        //arView.scene.removeAnchor(anchor)
        //arView.session.pause()
        
        performSegue(withIdentifier: "treeSize_seg", sender: self)
        
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        //var shareClick = true
        clickSound.play()
        
        topBar.isHidden = true
        scaleDown.isHidden = true
        scaleUp.isHidden = true
        placeBar.isHidden = true
        addBut.isHidden = true
        
        
//        UIGraphicsBeginImageContext(arView.bounds.size)
//        view.layer.render(in: UIGraphicsGetCurrentContext()!)
//
//        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
//
//            return
//        }
//
//        let share = UIActivityViewController(activityItems: [image], applicationActivities: nil)
//
//        present(share, animated: true, completion: nil)
        
        
        let bounds = shareView.bounds
            UIGraphicsBeginImageContextWithOptions(bounds.size, true, 5.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: true)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img as Any], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
        
        //viewDidAppear(true)
        
        
    }
    
    
    
    
    
    
    
    
//    @IBAction func placeClick(_ sender: Any) {
//
//        if !treePlaced {
//
//            print ("Placing Tree")
//
//            anchor = try! TreeScene.loadTree()
//
//            //anchor.notifications.place.post()
//            arView.scene.addAnchor(anchor)
//            //anchor.isEnabled = true
//
//            treePlaced = true
//
//            treeHeight = 3.8
//            treeWidth = 1.4
//
//            viewDidAppear(true)
//        }
//
//        else {
//
//            arView.scene.removeAnchor(anchor)
//            //anchor.isEnabled  = false
//            //treePlaced = false
//        }
//    }
    
    @IBAction func scaleUp(_ sender: Any) {
        
        
        
        if (TreeHeight < 9.6) {
            
            print("scale")
            anchor.notifications.scaleUp.post()
            scaleCount += 1
            TreeHeight = 3 * (1 + scaleCount * 0.2)
            TreeWidth = 1 * (1 + scaleCount * 0.2)
            //viewDidAppear(true)
            resetTree()
            
        }
        
        sizeSound.play()
        

    }
    
    @IBAction func scaleDown(_ sender: Any) {
        
        
        
        if (TreeHeight > 2.5) {
            
            anchor.notifications.scaleDown.post()
            scaleCount -= 1
            TreeHeight =  3 * (1 + scaleCount * 0.2)
            TreeWidth = 1 * (1 + scaleCount * 0.2)
            //viewDidAppear(true)
            resetTree()
        }
        
        sizeSound.play()
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("updateCounting")), userInfo: nil, repeats: true)
    }

    @objc func updateCounting() {
        
        
        print("counting..")
    }
}

extension Double {
    // Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
