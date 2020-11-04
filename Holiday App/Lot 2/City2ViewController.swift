//
//  City1ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit
import MapKit

var eventRow2 = Int()

class City2ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    //@IBOutlet weak var eventTable: UITableView!
    //@IBOutlet weak var treesCollectionView: UICollectionView!
    
    
    //@IBOutlet weak var events_visual: UIVisualEffectView!
    //@IBOutlet weak var events_box: UIView!
    
    
    
    //@IBOutlet weak var trees_visual: UIVisualEffectView!
    //@IBOutlet weak var trees_box: UIView!
    
    
    @IBOutlet weak var eventTable: UITableView!
    @IBOutlet weak var treesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var events_visual: UIVisualEffectView!
    @IBOutlet weak var events_box: UIView!
    
    @IBOutlet weak var trees_visual: UIVisualEffectView!
    @IBOutlet weak var trees_box: UIView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Directions button redirect
    
    @IBAction func directions(_ sender: Any) {
        
        let latt:CLLocationDegrees = -123.279484
        let log:CLLocationDegrees = 44.563715
        
        //let regionDist:CLLocationDistance = 1000;
        let coord = CLLocationCoordinate2D(latitude: latt, longitude: log)
        
        let placeMark = MKPlacemark(coordinate: coord)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.openInMaps()
    }
    
    
    // Events information array

    let events =
        ["Dec 19 - Event 1", "Dec 21 - Event 2"]
    
    // Trees information array
    
    let trees =
        [ "Tree 1", "Tree 2", "Tree 3"]
    
    let treeImg: [UIImage] =
        [UIImage(named: "city.png")!, UIImage(named: "city.png")!, UIImage(named: "city.png")!]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        eventTable.delegate = self
        eventTable.dataSource = self
        
        treesCollectionView.delegate = self
        treesCollectionView.dataSource = self
        
        //events_visual.clipsToBounds = true
        events_visual.layer.cornerRadius = 10.0
        events_box.layer.cornerRadius = 10.0
        //events_box.layer.borderWidth = 2.0
        
        //trees_visual.clipsToBounds = true
        trees_visual.layer.cornerRadius = 10.0
        trees_box.layer.cornerRadius = 10.0
        //trees_box.layer.borderWidth = 2.0
        
        //directionsButton.layer.cornerRadius = 10.0
        //directionsButton.layer.borderWidth = 2.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is Events2ViewController {
            
            let vc = segue.destination as? Events2ViewController
            vc?.localIndex = eventRow2
            
            //print("In event prepare")
        }
        
        if segue.destination is Trees2ViewController {
            
            let vc = segue.destination as? Trees2ViewController
            vc?.localIndex = eventRow2
            
            //print("In trees prepare")
        }
            
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trees.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tree_cell", for: indexPath) as! Trees2CollectionViewCell
        
        cell.treeTypeLabel.text = trees[indexPath.item]
        cell.treeTypeImage.image = treeImg[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("In tree select at")
        
        eventRow2 = indexPath.item
        
        performSegue(withIdentifier: "tree_seg", sender: self)
        
    }
    
    
    
    
    
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("Index", indexPath.row)
        
        eventRow2 = indexPath.row

        performSegue(withIdentifier: "event_seg", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = eventTable.dequeueReusableCell(withIdentifier: "event_cell", for: indexPath)
        
        cell.textLabel?.highlightedTextColor = .black
        cell.textLabel?.textColor = .systemGray6
        cell.textLabel?.text = events[indexPath.row]
        
        return cell
    }
}
