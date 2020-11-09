//
//  AboutVC.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/5/20.
//

import UIKit

class AboutVC: UIViewController {
    
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    
    @IBOutlet weak var lab: UILabel!
    
    @IBAction func website_click(_ sender: UIButton) {
        
        if let url = URL(string: "http://www.theholidayapp.com") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func privacy_click(_ sender: UIButton) {
        
        if let url = URL(string: "http://www.theholidayapp.com/privacy") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
