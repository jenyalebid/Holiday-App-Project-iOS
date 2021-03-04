//
//  MapViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/16/20.
//

import UIKit
import MapKit
import Contacts
import GeoFire
import FirebaseDatabase




class MapViewController: UIViewController {
    
    
    var lotName = String()
    var address = String()
    var phone = String()
    var lat = Double()
    var long = Double()

    private var lots: [MapLot] = []

    let lotDatabase = Database.database().reference()
    
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    var currentLoc = CLLocation()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationsNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow // the map follows user's location

//        let ref = Database.database().reference()
//        ref.childByAutoId().setValue(["lotName":"Pumkin City", "Tree Count":"Cool"])
        
    }

    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
    }

    // only find location when app is in use
    func locationAuthStatus() {

        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {

            mapView.showsUserLocation = true // shows user location
        } else {

            locationManager.requestWhenInUseAuthorization() // prompt for location
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        if status == CLAuthorizationStatus.authorizedWhenInUse {

            mapView.showsUserLocation = true
        }
    }

    func centerMapOnLocation(location: CLLocation) {

        let geoFire = GeoFire(firebaseRef: lotDatabase)
        
        // set the region around area
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
//        mapView.setRegion(coordinateRegion, animated: true)
        
        // set location looking for distance
        let center = CLLocation(latitude: coordinateRegion.center.latitude, longitude: coordinateRegion.center.longitude)
        //let center = CLLocation(latitude: 51.49712853205043, longitude: -0.09649467336302968)
        let circleQuery = geoFire.query(at: center, withRadius: 100.00)
        
        // set pan around distance from person
//        mapView.setCameraBoundary(
//            MKMapView.CameraBoundary(coordinateRegion: coordinateRegion),
//            animated: true)
//
//        // set camera zoom boundary
//        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 20000)
//        mapView.setCameraZoomRange(zoomRange, animated: false)
        
        //var lotCount = Int()

        //Query location by region
//        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
//        let query = geoFire.query(with: coordinateRegion)
//        var regionQuery = geoFire.queryWithRegion(query)
        
        
        //self.lotDatabase.child("lol").setValue(["username": "bob"])
        //self.lotDatabase.setValue.
        // get the info from the data base
            
        var lotValue: NSDictionary?
        //geoFire.setLocation(CLLocation(latitude: 37.739167003963644, longitude: -122.40659010212623), forKey: "ca1")
        
        _ = circleQuery.observe(.keyEntered, with: { (key: String!, location: CLLocation!) in
            print("Key '\(String(describing: key))' entered the search area and is at location '\(String(describing: location))'")
            
            //var lotInfo = [String:Any]()
            
            self.lotDatabase.child(key).observeSingleEvent(of: .value) { [self] (DataSnapshot) in
                
                //lotInfo = DataSnapshot.value as? [String : Any] ?? [nil]
                //let lotInfo = DataSnapshot.value as? [String:Any]
                
                lotValue = DataSnapshot.value as? NSDictionary
                
                self.lotName = lotValue?["name"] as? String ?? ""
                self.address = lotValue?["address"] as? String ?? ""
                self.phone = lotValue?["phone"] as? String ?? ""
                //print(lotName)
                
                // use struct to display data as a pin
                let lot = MapLot(
                    title: self.lotName,
                    locationName: self.address,
                    discipline: self.phone,
                    coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
                //lotCount += lotCount
                lots.append(lot)
                self.mapView.addAnnotation(lot)
            }
            //self.locationsNumber.text = "There are \(lotCount) Tree Lots near you."
        })
    }

    // tells map to center
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

        if let loc = userLocation.location {

            // make sure the map doesn't keep recentering while walking
            if !mapHasCenteredOnce {
                print("center")
                centerMapOnLocation(location: loc)
                //mapHasCenteredOnce = true
            }
        }
    }

    func getLocations() {

//        let geoFire = GeoFire(firebaseRef: geofireRef)
//        geoFire.setLocation(CLLocation(latitude: 37.79387134480613, longitude: -122.40864749425201), forKey: "firebase-oss")
//        geoFire.setLocation(CLLocation(latitude: 44.56851365906304, longitude: -123.27647756608198), forKey: "osu")
//
//        geoFire.getLocationForKey("firebase-oss") { (location, error) in
//          if (error != nil) {
//            print("An error occurred getting the location for \"firebase-hq\": \(String(describing: error?.localizedDescription))")
//          } else if (location != nil) {
//            print("Location for \"firebase-hq\" is [\(String(describing: location?.coordinate.latitude)), \(String(describing: location?.coordinate.longitude))]")
//
//            self.currentLoc = location!
//
////            let artwork = MapLot(
////                title: "King David Kalakaua",
////                locationName: "Waikiki Gateway Park",
////                discipline: "Sculpture",
////                coordinate: CLLocationCoordinate2D(latitude: self.currentLoc.coordinate.latitude, longitude: self.currentLoc.coordinate.longitude))
////
////            self.mapView.addAnnotation(artwork)
//
//
//
//          } else {
//            print("GeoFire does not contain a location for \"firebase-hq\"")
//          }
//        }
    }


    @IBAction func currentLocClick(_ sender: Any) {
        
        print("get")
    }
    

    
}


extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

    guard let annotation = annotation as? MapLot else {
        
      return nil
    }

    let identifier = "tree_lot"
    var view: MKMarkerAnnotationView

    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
        
    } else {
        
      view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }

    return view
    }
    

    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
        
        lotName = view.annotation?.title!! ?? "No Val"
        address = view.annotation?.subtitle!! ?? "No Val"
        
        for i in lots {
            
            if i.locationName == lotName {
                
                phone = i.discipline ?? "No Value"
                lat = i.coordinate.latitude
                long = i.coordinate.longitude
                
                
                break
            }
            lat = i.coordinate.latitude
            long = i.coordinate.longitude
            print("LAT ", lat, " LONG ", long)
        }

        performSegue(withIdentifier: "lot_tap", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is City1ViewController {
            
            let vc = segue.destination as? City1ViewController
            vc?.localName = lotName
            vc?.localAddress = address
            vc?.localPhone = phone
            vc?.localLat = lat
            vc?.localLong = long
            print(lots)
        }
        
        
    }
    
}
