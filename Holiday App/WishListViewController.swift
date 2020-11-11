//
//  WishListViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/10/20.
//

import UIKit


// Get the array from UserDefaults
var wishArray = UserDefaults.standard.object(forKey: "wishArray") as? [String] ?? []

class WishListViewController: UIViewController {
    
    @IBOutlet weak var wishView: UITableView!
    @IBOutlet weak var addWishButton: UIButton!
    @IBOutlet weak var addWishField: UITextField!
    @IBOutlet weak var wishListView: UIView!
    @IBOutlet weak var shareView: UIView!
    
    @IBAction func shareClick(_ sender: Any) {
        
        UIGraphicsBeginImageContext(shareView.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            
            return
        }
        
        let share = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        

        
        present(share, animated: true, completion: nil)
        

        
    }
    
    
    
    @IBAction func clickAddWish(_ sender: UIButton) {
        
        saveWish()
        updateWishList()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWishField.delegate = self
        wishView.delegate = self
        wishView.dataSource = self
        
        addWishButton.layer.cornerRadius = 10.0
    }
    
    func updateWishList () {
        
        wishView.reloadData()
    }
    
    func saveWish() {
        
        // Get value from the text field
        guard let newWish = addWishField.text, !newWish.isEmpty else {
    
            return
        }
        
        // Append array
        wishArray.append(newWish)
        
        // Replace the old array with appended array
        UserDefaults.standard.setValue(wishArray, forKey: "wishArray")
        
        addWishField.text = ""
    }
    
    func deleteWish() {
        
        UserDefaults.standard.setValue(wishArray, forKey: "wishArray")
        updateWishList()
    }
}

extension WishListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            wishArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            deleteWish()
    
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
        
        return wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath) as! WishTableViewCell
        //let wishCount = String(wishList.count)
        
        cell.wishLabel.text = wishArray[indexPath.row]
        cell.wishNumber.text = "\(String(indexPath.row + 1))."
        
        return cell
    }
}
