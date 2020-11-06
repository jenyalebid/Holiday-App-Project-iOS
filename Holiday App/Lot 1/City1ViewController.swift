//
//  City1ViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 10/16/20.
//

import UIKit
import MapKit

var treeName = String()
let tree_struct = DataLoader().treeData
let lot_struct = DataLoader().lotData


class City1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var current_lot = Int()
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
    
    
    // Trees information array
    
    
//    var lot1_trees = [""]
//    var lot2_trees = [""]
//    var lot3_tress = [""]
//
//    init(lot1_trees: [String], lot2_trees: [String], lot3_tress: [String]) {
//
//        self.lot1_trees = lot1_trees
//        self.lot2_trees = lot2_trees
//        self.lot3_tress = lot3_tress
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    struct Trees {
//
//        var treeImg = UIImage()
//        var treeName = String()
//        var treeDesc = String()
//    }
//
//    let silvertip = Trees(), douglas = Trees(), nordmann = Trees(), grand = Trees(), fraiser = Trees()
//
//
//    func treesList() -> [Int]{
//
//        var tree_array = [[Int]]()
//        var trees = [Int]()
//
//
//        let lot1_trees = [0, 1, 2, 3, 4, 5]
//        let lot2_trees = [1, 2, 3, 5]
//        let lot3_trees = [1, 2, 3, 5]
//
//        tree_array.append(lot1_trees)
//        tree_array.append(lot2_trees)
//        tree_array.append(lot3_trees)
//
//        trees = tree_array[current_lot]
//
//        return trees
//    }
    
//    func treesList() -> [String]{
//
//        var tree_array = [[String]]()
//        var trees = [String]()
//
//         let lot1_trees = ["Silvertip Fir", "Douglas Fir", "Nordmann Fir", "Noble Fir", "Grand Fir", "Fraser Fir"]
//         let lot2_trees = ["Noble Fir", "Douglas Fir", "Frazier Fir", "Nordmann Fir"]
//         let lot3_trees = ["Noble Fir", "Douglas Fir", "Frazier Fir", "Nordmann Fir"]
//
//
//        tree_array.append(lot1_trees)
//        tree_array.append(lot2_trees)
//        tree_array.append(lot3_trees)
//
//        trees = tree_array[current_lot]
//
//        return trees
//    }
    

    let treeImg: [UIImage] =
        [UIImage(named: "silvertip.png")!, UIImage(named: "douglas.png")!, UIImage(named: "nordmann.png")!, UIImage(named: "noble.png")!, UIImage(named: "grand.png")!, UIImage(named: "fraser.png")!]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        treesCollectionView.delegate = self
        treesCollectionView.dataSource = self
        
        map_visual.layer.cornerRadius = 10.0
        map_box.layer.cornerRadius = 10.0
        
        //trees_visual.clipsToBounds = true
        trees_visual.layer.cornerRadius = 10.0
        trees_box.layer.cornerRadius = 10.0
        
        directionsButton.layer.cornerRadius = 10.0
        //directionsButton.layer.borderWidth = 2.0
        
        lot_name.text = lot_struct[current_lot].lotName
        
        
        
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
        
        cell.treeTypeLabel.text = tree_struct[trees[indexPath.item]].treeName
        cell.treeTypeImage.image = treeImg[trees[indexPath.item]]
        cell.treeTypeImage.layer.cornerRadius = 10.0
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("In tree select at")
        
        //var trees = [Int]()
        //trees = treesList()
        
        let trees = lot_struct[current_lot].lotTreeTypes
        
        treeName = tree_struct[trees[indexPath.item]].treeName
        //treeName = tree_struct[indexPath.item].treeName
        
        performSegue(withIdentifier: "tree_seg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is Events1ViewController {
            
            // stuff going on here
            
            //let vc = segue.destination as? Events1ViewController
            //vc?.localIndex = eventRow
            
            //print("In event prepare")
        }
        
        if segue.destination is Trees1ViewController {
            
            let vc = segue.destination as? Trees1ViewController
            vc?.localTreeName = treeName
            
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
