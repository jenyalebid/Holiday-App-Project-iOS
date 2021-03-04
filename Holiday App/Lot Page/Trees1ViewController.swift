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
    @IBOutlet weak var treeType_desc: UILabel!
    @IBOutlet weak var treeTypeDesc_scrollView: UIScrollView!
    
    @IBAction func ARClick(_ sender: Any) {
        print("HEY")
        performSegue(withIdentifier: "arClick_seg", sender: self)
    }
    
    
    var localIndex = Int()
    var localTreeName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("On trees", localIndex)
        
        treeTypeDesc_scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: treeType_desc.bottomAnchor).isActive = true
        
        let localImg = UIImage(named: tree_struct[localIndex].treeBackImg)
        
        treeType_title.text = tree_struct[localIndex].treeName
        treeType_desc.text = tree_struct[localIndex].treeDesc
        treeType_image.image = localImg
        
    }

}
