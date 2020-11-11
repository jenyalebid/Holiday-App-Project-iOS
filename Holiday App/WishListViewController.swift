//
//  WishListViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/10/20.
//

import UIKit
//import SwiftUI

var wishCount = Int()

class WishListViewController: UIViewController {
    
    @IBOutlet weak var wishView: UITableView!
    @IBOutlet weak var addWishButton: UIButton!
    @IBOutlet weak var addWishField: UITextField!
    
    @IBOutlet weak var wishLabel: UILabel!
    
    
    @IBAction func clickAddWish(_ sender: UIButton) {
        
        saveWish()
        updateWishList()
    }
    
    
    
    var wishList = [String]()
    
//    @IBSegueAction func addSwiftUIList(_ coder: NSCoder) -> UIViewController? {
//
//        //return UIHostingController(coder: coder, rootView: ContentView())
//
//        let hostingController = UIHostingController(coder: coder, rootView: ContentView())
//        hostingController!.view.backgroundColor = UIColor.clear;
//
//        return hostingController
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWishField.delegate = self
        wishView.delegate = self
        wishView.dataSource = self
        
        DispatchQueue.main.async {
            
            self.updateWishList()
        }
        
        addWishButton.layer.cornerRadius = 10.0
        
        
        
        if !UserDefaults.standard.bool(forKey: "setup") {
            
            UserDefaults.standard.set(true, forKey: "setup")
            UserDefaults.standard.set(0, forKey: "wishCount")
        }

        // Do any additional setup after loading the view.
    }
    
 
    
    func updateWishList () {
        
        wishList.removeAll()
        
        guard let count = UserDefaults.standard.value(forKey: "wishCount") as? Int else {
            
            return
        }
        
        for x in 0..<count {
            
            if let wish = UserDefaults.standard.value(forKey: "wishField_\(x+1)") as? String {
                
                wishList.append(wish)
            }
        }
        
        addWishField.text = ""
        wishView.reloadData()
    }
    
    
    func saveWish() {
        
        guard let text = addWishField.text, !text.isEmpty else {
            
            return
        }
        
        guard let count = UserDefaults.standard.value(forKey: "wishCount") as? Int else {
            
            return
        }
        
        let newCount = count + 1
        
        UserDefaults.standard.set(newCount, forKey: "wishCount")
        
        UserDefaults.standard.set(text, forKey: "wishField_\(newCount)")
        
    }
    
    func deleteWish(deleteRow: Int) {
        
        //UserDefaults.standard.set("bob", forKey: "wishField_\(deleteRow)")
    }
    

    

}



extension WishListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

            //let currentRow = indexPath.row + 1
            //print(newCount, "and", indexPath.row)
            
            
            UserDefaults.standard.removeObject(forKey: "wishField_\(indexPath.row + 1)")
            
            
            
            
            
            
//            guard let count = UserDefaults.standard.value(forKey: "wishCount") as? Int else {
//
//                return
//            }
//
//            for x in indexPath.row + 2...count {
//
//                print("current row is ", x, " and next row is ", x + 1)
//
//                let nextItem = UserDefaults.standard.value(forKey: "wishField_\(x + 1)")
//
//                UserDefaults.standard.setValue(nextItem, forKey: "wishField_\(x)")
//
//            }
            
            
            
            
            
            wishList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            UserDefaults.standard.setValue(wishList.count, forKey: "wishCount")
            //UserDefaults.standard.set(nil, forKey: "wishField_\(indexPath.row)")
        
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}


extension WishListViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}

extension WishListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath) as! WishTableViewCell
        //let wishCount = String(wishList.count)
        
        cell.wishLabel.text = wishList[indexPath.row]
        //cell.wishNumber.text = wishCount
        
        return cell
    }
    

    
    
}
