//
//  ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    var lot = Int()
    
    @IBOutlet weak var city_box_vis: UIVisualEffectView!
    @IBOutlet weak var city_select_box: UIView!
    @IBOutlet weak var city1: UIButton!
    @IBOutlet weak var city2: UIButton!
    @IBOutlet weak var city3: UIButton!
    

    
    @IBAction func city1(_ sender: UIButton) {
        
        UserDefaults.standard.set("lot1" as String, forKey: "lot1")
        
        lot = 0
        
        performSegue(withIdentifier: "lot_seg", sender: self)
    }
    
    @IBAction func city2(_ sender: UIButton) {
        
        UserDefaults.standard.set("lot2" as String, forKey: "lot2")
        
        lot = 1
        
        performSegue(withIdentifier: "lot_seg", sender: self)
    }
    
    @IBAction func city3(_ sender: UIButton) {
        
        UserDefaults.standard.set("lot3" as String, forKey: "lot3")
        
        lot = 2
        
        performSegue(withIdentifier: "lot_seg", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! City1ViewController
        vc.current_lot = self.lot
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //city_box_vis.clipsToBounds = true
        city_box_vis.layer.cornerRadius = 10.0
        city_select_box.layer.cornerRadius = 10.0
        //city_select_box.layer.borderWidth = 2.0
        //city_select_box.layer.borderColor =
        //let darkBlur = UIBlurEffect(style: .dark)
        //let blurView = UIVisualEffectView(effect: darkBlur)
        //blurView.frame = .bounds
        
    
       //city1.addSubview(blurView)


    }

}
