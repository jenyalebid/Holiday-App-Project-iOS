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
    

    @IBOutlet weak var westBloom: UIImageView!
    @IBOutlet weak var petaluma: UIImageView!
    @IBOutlet weak var laguna: UIImageView!
    @IBOutlet weak var notInCity: UIButton!
    

    @IBAction func city1(_ sender: UIButton) {
        
        lot = 0
        
        UserDefaults.standard.set(lot as Int, forKey: "lotName")
        print(UserDefaults.standard.value(forKey: "lotName")!)
        performSegue(withIdentifier: "lot_seg", sender: self)
        
        
    }
    
    @IBAction func city2(_ sender: UIButton) {
        
        lot = 1
        
        UserDefaults.standard.set(lot as Int, forKey: "lotName")
        print(UserDefaults.standard.value(forKey: "lotName")!)
        performSegue(withIdentifier: "lot_seg", sender: self)
    }
    
    @IBAction func city3(_ sender: UIButton) {
        
        lot = 2
        
        UserDefaults.standard.set(lot as Int, forKey: "lotName")
        print(UserDefaults.standard.value(forKey: "lotName")!)
        performSegue(withIdentifier: "lot_seg", sender: self)
    }
    
    @IBAction func notCity(_ sender: Any) {
        
        lot = 3
        UserDefaults.standard.set(lot as Int, forKey: "lotName")
        print(UserDefaults.standard.value(forKey: "lotName")!)
        performSegue(withIdentifier: "noCity_seg", sender: self)
    }
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let vc = segue.destination as! City1ViewController
//        vc.current_lot = self.lot
//
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //city_box_vis.clipsToBounds = true
        //city_box_vis.layer.cornerRadius = 10.0
        //city_select_box.layer.cornerRadius = 10.0
        
        westBloom.layer.cornerRadius = 10.0
        petaluma.layer.cornerRadius = 10.0
        laguna.layer.cornerRadius = 10.0
        notInCity.layer.cornerRadius = 10.0
        //city_select_box.layer.borderWidth = 2.0
        //city_select_box.layer.borderColor =
        //let darkBlur = UIBlurEffect(style: .dark)
        //let blurView = UIVisualEffectView(effect: darkBlur)
        //blurView.frame = .bounds
        
    
       //city1.addSubview(blurView)


    }

}
