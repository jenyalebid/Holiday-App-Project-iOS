//
//  TreesViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/18/20.
//

import UIKit

class Trees1ViewController: UIViewController {
    
    
    @IBOutlet weak var treeType_image: UIImageView!
    @IBOutlet weak var treeType_title: UILabel!
    @IBOutlet weak var treeType_price: UILabel!
    @IBOutlet weak var treeType_desc: UILabel!
    

    var localIndex = Int()
    
    let treeType_titles =
        ["Silvertip Fir", "Douglas Fir", "Nordmannn Fir", "Noble Fir", "Grand Fir", "Fraser Fir"]

    let treeType_prices =
        ["$30 - $50", "$30 - $50", "$30 - $50", "$30 - $50", "$30 - $50", "$30 - $50"]

    let treeType_descriptions =
        ["Description 1 and whaterver else you want here so I dont know",
         "Description 2 and what you want to make and I will make",
         "Description 2 and what you want to make and I will make",
         "Description 2 and what you want to make and I will make",
         "Description 2 and what you want to make and I will make",
         "Description 2 and what you want to make and I will make"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("On trees", localIndex)
        
       
        
        treeType_title.text = treeType_titles[localIndex]
        treeType_price.text = treeType_prices[localIndex]
        treeType_desc.text = treeType_descriptions[localIndex]
        
    }

}