//
//  City1ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit
import MapKit



let tree_struct = DataLoader().treeData
let lot_struct = DataLoader().lotData


class City1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    
    var treeIDSend = Int()
    var current_lot = UserDefaults.standard.value(forKey: "lotName") as! Int
    //var trees = [Int]()
    
    
    init() {
        
        //self.current_lot = current_lot
        //self.current_lot = current_lot
        

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    

    @IBOutlet weak var treesCollectionView: UICollectionView!
    @IBOutlet weak var trees_visual: UIVisualEffectView!
    @IBOutlet weak var trees_box: UIView!
    
    @IBOutlet weak var map_visual: UIVisualEffectView!
    @IBOutlet weak var map_box: MKMapView!
    @IBOutlet weak var location_map: MKMapView!
    
    @IBOutlet weak var lot_name: UILabel!
    @IBOutlet weak var lot_logo: UIImageView!
    
    @IBAction func websiteClick(_ sender: Any) {
        
        
    }
    
    @IBAction func twitterClick(_ sender: Any) {
        
        
    }
    
    @IBAction func facebookClick(_ sender: Any) {
        
        
    }
    
    
    
    
    
    // Directions button redirect
    
    @IBOutlet weak var directionsButton: UIButton!
    @IBAction func directions(_ sender: Any) {
        
        let latitude: CLLocationDegrees = lot_struct[current_lot].lotLatCoord
        let longitude: CLLocationDegrees = lot_struct[current_lot].lotLongCoord
        
        let regionDistance:CLLocationDistance = 600
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = lot_struct[current_lot].lotName
        mapItem.openInMaps(launchOptions: options)
    }
    
    @IBOutlet weak var offerImg: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("USER DEF", UserDefaults.standard.value(forKey: "lotName")!)
        
        treesCollectionView.delegate = self
        treesCollectionView.dataSource = self
        
        map_visual.layer.cornerRadius = 10.0
        map_box.layer.cornerRadius = 10.0
        
        //trees_visual.clipsToBounds = true
        trees_visual.layer.cornerRadius = 10.0
        trees_box.layer.cornerRadius = 10.0
        map_box.layer.cornerRadius = 10.0
        
        
        directionsButton.layer.cornerRadius = 10.0
        //directionsButton.layer.borderWidth = 2.0
        
        //print(lot_struct[current_lot].lotLogo != "")
        if lot_struct[current_lot].lotLogo != "" {
            
            lot_logo.image = UIImage(named: lot_struct[current_lot].lotLogo)
        }
        else {
            
            lot_name.text = lot_struct[current_lot].lotName
        }
        
        
        
        
        
        // map location
        let initialLocation = CLLocation(latitude: lot_struct[current_lot].lotLatCoord, longitude: lot_struct[current_lot].lotLongCoord)
        //var coordinate = CLLocationCoordinate2D(latitude: 38.242910, longitude: -122.63161)
        
        // map annotation
        let lot_location = MKPointAnnotation()
        lot_location.title = lot_struct[current_lot].lotName
        lot_location.coordinate = CLLocationCoordinate2D(latitude: lot_struct[current_lot].lotLatCoord, longitude: lot_struct[current_lot].lotLongCoord)
        
        // center map and annotation
        location_map.centerToLocation(initialLocation)
        location_map.addAnnotation(lot_location)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //print(lot_struct.count)
        return lot_struct[current_lot].lotTreeTypes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tree_cell", for: indexPath) as! Trees1CollectionViewCell
        
        //print("Trees ARRAY ", trees)
        
        let trees = lot_struct[current_lot].lotTreeTypes
        let cellImg = UIImage(named: tree_struct[trees[indexPath.item]].treeFrontImg)
        
        cell.treeTypeImage.image = cellImg
        cell.treeTypeLabel.text = tree_struct[trees[indexPath.item]].treeName
        
        cell.treeTypeImage.layer.cornerRadius = 10.0
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("In tree select at")
        
        //var trees = [Int]()
        //trees = treesList()
        
        let trees = lot_struct[current_lot].lotTreeTypes
        
        treeIDSend = tree_struct[trees[indexPath.item]].treeID
        //treeName = tree_struct[indexPath.item].treeName
        
        performSegue(withIdentifier: "tree_seg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is OfferViewController {
            
            // stuff going on here
            
            //let vc = segue.destination as? Events1ViewController
            //vc?.localIndex = eventRow
            
            //print("In event prepare")
        }
        
        if segue.destination is Trees1ViewController {
            
            let vc = segue.destination as? Trees1ViewController
            vc?.localIndex = treeIDSend
            
            //print("In trees prepare")
        }
    }
}

// interactive map info
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
