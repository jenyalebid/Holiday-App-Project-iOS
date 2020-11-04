//
//  City1ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit
import MapKit

var eventRow = Int()

class City1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventTable: UITableView!
    @IBOutlet weak var treesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var events_visual: UIVisualEffectView!
    @IBOutlet weak var events_box: UIView!
    
    
    @IBOutlet weak var trees_visual: UIVisualEffectView!
    @IBOutlet weak var trees_box: UIView!
    
    
    @IBOutlet weak var location_map: MKMapView!
    
    
    
    
    
    
    
    
    
    // Directions button redirect
    
    @IBOutlet weak var directionsButton: UIButton!
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
        ["Silvertip Fir", "Douglas Fir", "Nordmann Fir", "Noble Fir", "Grand Fir", "Fraser Fir"]
    
    let treeImg: [UIImage] =
        [UIImage(named: "silvertip.png")!, UIImage(named: "douglas.png")!, UIImage(named: "nordmann.png")!, UIImage(named: "noble.png")!, UIImage(named: "grand.png")!, UIImage(named: "fraser.png")!]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //eventTable.delegate = self
        //eventTable.dataSource = self
        
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
        
        
        
        directionsButton.layer.cornerRadius = 10.0
        //directionsButton.layer.borderWidth = 2.0
        
        // Set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 38.242910, longitude: -122.631610)
        //var coordinate = CLLocationCoordinate2D(latitude: 38.242910, longitude: -122.63161)
        
        let lot_location = MKPointAnnotation()
        lot_location.title = "Pronzini Christmas Trees"
        lot_location.coordinate = CLLocationCoordinate2D(latitude: 38.242910, longitude: -122.631610)
        
        location_map.centerToLocation(initialLocation)
        location_map.addAnnotation(lot_location)



    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is Events1ViewController {
            
            let vc = segue.destination as? Events1ViewController
            vc?.localIndex = eventRow
            
            //print("In event prepare")
        }
        
        if segue.destination is Trees1ViewController {
            
            let vc = segue.destination as? Trees1ViewController
            vc?.localIndex = eventRow
            
            //print("In trees prepare")
        }
            
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trees.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tree_cell", for: indexPath) as! Trees1CollectionViewCell
        
        cell.treeTypeLabel.text = trees[indexPath.item]
        cell.treeTypeImage.image = treeImg[indexPath.item]
        cell.treeTypeImage.layer.cornerRadius = 10.0
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("In tree select at")
        
        eventRow = indexPath.item
        
        performSegue(withIdentifier: "tree_seg", sender: self)
        
    }
    
    
    
    
    
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("Index", indexPath.row)
        
        eventRow = indexPath.row

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


private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 600
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
