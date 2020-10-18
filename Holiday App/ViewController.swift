//
//  ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var city_box_vis: UIVisualEffectView!
    @IBOutlet weak var city_select_box: UIView!
    @IBOutlet weak var city1: UIButton!
    @IBOutlet weak var city2: UIButton!
    @IBOutlet weak var city3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        city_box_vis.clipsToBounds = true
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

