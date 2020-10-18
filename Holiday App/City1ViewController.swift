//
//  City1ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit
import MapKit

class City1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var eventTable: UITableView!
    @IBOutlet weak var treesCollectionView: UICollectionView!
    
    @IBOutlet weak var events_visual: UIVisualEffectView!
    @IBOutlet weak var events_box: UIView!
    
    @IBOutlet weak var trees_visual: UIVisualEffectView!
    @IBOutlet weak var trees_box: UIView!
    
    
    
    
    
    

    @IBAction func directions(_ sender: Any) {
        
        let latt:CLLocationDegrees = -123.279484
        let log:CLLocationDegrees = 44.563715
        
        //let regionDist:CLLocationDistance = 1000;
        let coord = CLLocationCoordinate2D(latitude: latt, longitude: log)
        
        let placeMark = MKPlacemark(coordinate: coord)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.openInMaps()
    }
    
    
    let events = [
    
        "Dec 19 - Event 1", "Dec 21 - Event 2", "Dec 24 - Event 3", "Dec 26 - Event 4"
    
    
    ]
    
    let dates = ["18", "21"]
    
    
    let trees = [ "Tree 1", "Tree 2", "Tree 3"]
    
    let treeImg: [UIImage] = [UIImage(named: "city.png")!, UIImage(named: "city.png")!, UIImage(named: "city.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        eventTable.delegate = self
        eventTable.dataSource = self
        
        treesCollectionView.delegate = self
        treesCollectionView.dataSource = self
        
        
        events_visual.clipsToBounds = true
        events_visual.layer.cornerRadius = 25.0
        events_box.layer.cornerRadius = 25.0
        events_box.layer.borderWidth = 3.0
        
        
        trees_visual.clipsToBounds = true
        trees_visual.layer.cornerRadius = 25.0
        trees_box.layer.cornerRadius = 25.0
        trees_box.layer.borderWidth = 3.0
            
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tree_cell", for: indexPath) as! TreesCollectionViewCell
        
        cell.TreeTypeLabel.text = trees[indexPath.item]
        cell.TreeTypeImage.image = treeImg[indexPath.item]
        
        return cell
    }
    
    


}


extension City1ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Test Tap")
    }
    
}

extension City1ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = eventTable.dequeueReusableCell(withIdentifier: "event_cell", for: indexPath)
        
        cell.textLabel?.highlightedTextColor = .black
        cell.textLabel?.textColor = .systemGray6
        //event_date_box.text = dates[indexPath.row]
        cell.textLabel?.text = events[indexPath.row]
        
        return cell
    }
    
    
}


/*

extension City1ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Test Tap")
    }
    
}


extension City1ViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return trees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tree_cell", for: <#T##IndexPath#>) as! TreesCollectionViewCell
        
        cell.TreeTypeNames.text = trees[indexPath.row]
        
        return cell
    }
    
    
}
*/
