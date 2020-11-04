//
//  TreesViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/18/20.
//

import UIKit

class Trees2ViewController: UIViewController {
    
    
    @IBOutlet weak var treeType_image: UIImageView!
    @IBOutlet weak var treeType_title: UILabel!
    @IBOutlet weak var treeType_price: UILabel!
    @IBOutlet weak var treeType_desc: UILabel!
    

    var localIndex = Int()
    
    let treeType_titles =
        ["Tree 1", "Tree 2"]

    let treeType_prices =
        ["Dec 17 at 7 PM", "Dec 21 at 3 PM"]

    let treeType_descriptions =
        ["Description 1 and whaterver else you want here so I dont know",
         "Description 2 and what you want to make and I will make"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("On trees", localIndex)
        
        treeType_title.text = treeType_titles[localIndex]
        treeType_price.text = treeType_prices[localIndex]
        treeType_desc.text = treeType_descriptions[localIndex]
        
    }

}
