//
//  TreeSizeGotViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 4/22/21.
//

import UIKit
import AVFoundation

class TreeSizeGotViewController: UIViewController {
    
    @IBOutlet weak var treeh: UILabel!
    @IBOutlet weak var treew: UILabel!
    @IBOutlet weak var contButton: UIButton!
    
    var clickSound = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        treeh.text = String(TreeHeight.rounded(toPlaces: 1))
        treew.text = String(TreeWidth.rounded(toPlaces: 1))
        contButton.layer.cornerRadius = 10.0
        
        
        do {
            
            clickSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "clickSound", ofType: "wav")!))
            clickSound.prepareToPlay()
            
        }
        catch {
            
            print("Can't play audio")
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toMapButton(_ sender: Any) {
        
        clickSound.play()
        
        performSegue(withIdentifier: "tabBar_seg", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "tabBar_seg"){
            if let tabVC = segue.destination as? UITabBarController{
                tabVC.selectedIndex = 1
            }
        }
    }
}


