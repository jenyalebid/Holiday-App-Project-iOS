//
//  MapViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/16/20.
//

import UIKit
import MapKit
import Contacts
import FirebaseDatabase



class MapViewController: UIViewController {

var latvalue = Float()
var longvalue = Float()
    let lotDatabase = Database.database().reference()
    

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Set initial location in Honolulu
        
//        lotDatabase.child("lots/lat").observeSingleEvent(of: .value, with: {snapshot in
//
//            latvalue = snapshot.value as [Float:Any]
//        })
//
//        lotDatabase.child("lots/long").observeSingleEvent(of: .value, with: {snapshot in
//
//            longvalue = snapshot.value as? [Float:Any]
//        })
//
//
//
//        let initialLocation = CLLocation(latitude: latvalue, longitude: longvalue)
        
        
        
                let ref = Database.database().reference()
        

        
                ref.childByAutoId().setValue(["lotName":"Pumkin City", "Tree Count":"Cool"])

    
        //mapView.addAnnotation(initialLocation as! MKAnnotation)

//        mapView.centerToLocation(initialLocation)


//        let region = MKCoordinateRegion(
//          center: initialLocation.coordinate,
//          latitudinalMeters: 50000,
//          longitudinalMeters: 60000)
//        mapView.setCameraBoundary(
//          MKMapView.CameraBoundary(coordinateRegion: region),
//          animated: true)
//
//        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
//        mapView.setCameraZoomRange(zoomRange, animated: true)

        //mapView.delegate = self
    }
}


private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 2000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}


//extension MapViewController: MKMapViewDelegate {
//  // 1
//  func mapView(
//    _ mapView: MKMapView,
//    viewFor annotation: MKAnnotation
//  ) -> MKAnnotationView? {
//    // 2
//    guard let annotation = annotation as? Artwork else {
//      return nil
//    }
//    // 3
//    let identifier = "artwork"
//    var view: MKMarkerAnnotationView
//    // 4
//    if let dequeuedView = mapView.dequeueReusableAnnotationView(
//      withIdentifier: identifier) as? MKMarkerAnnotationView {
//      dequeuedView.annotation = annotation
//      view = dequeuedView
//    } else {
//      // 5
//      view = MKMarkerAnnotationView(
//        annotation: annotation,
//        reuseIdentifier: identifier)
//      view.canShowCallout = true
//      view.calloutOffset = CGPoint(x: -5, y: 5)
//      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//    }
//    return view
//  }
//
//    func mapView(
//      _ mapView: MKMapView,
//      annotationView view: MKAnnotationView,
//      calloutAccessoryControlTapped control: UIControl
//    ) {
//      guard let artwork = view.annotation as? Artwork else {
//        return
//      }
//
//      let launchOptions = [
//        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
//      ]
//      artwork.mapItem?.openInMaps(launchOptions: launchOptions)
//    }
//}




//import UIKit
//import MapKit
//import GeoFire
//import FirebaseDatabase
//
//class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
//
//    @IBOutlet weak var mapView: MKMapView!
//
//    let locationManager = CLLocationManager()
//    var mapHasCenteredOnce = false
//    var geoFire: GeoFire!
//    var geoFireRef: DatabaseReference!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let ref = Database.database().reference()
//
//        ref.child("lotID").obse
//
//        //ref.childByAutoId().setValue(["name":"James", "role":"employee"])
//
//
//        mapView.delegate = self
//        mapView.userTrackingMode = MKUserTrackingMode.follow //The map follows user's location
//
//        let geofireRef = Database.database().reference()
//        let geoFire = GeoFire(firebaseRef: geofireRef)
//
//        geoFire.getLocationForKey("firebase-hq") { (location, error) in
//          if (error != nil) {
//            print("An error occurred getting the location for \"firebase-hq\": \(String(describing: error?.localizedDescription))")
//          } else if (location != nil) {
//            print("Location for \"firebase-hq\" is [\(String(describing: location?.coordinate.latitude)), \(String(describing: location?.coordinate.longitude))]")
//          } else {
//            print("GeoFire does not contain a location for \"firebase-hq\"")
//          }
//        }
//
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        locationAuthStatus()
//    }
//
//    func locationAuthStatus() {
//        //Only find location when app is in use
//        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
//
//            mapView.showsUserLocation = true //Shows user location
//        } else {
//
//            locationManager.requestWhenInUseAuthorization() //Prompt "can I access your location"
//        }
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//
//        if status == CLAuthorizationStatus.authorizedWhenInUse {
//
//            mapView.showsUserLocation = true
//
//        }
//
//    }
//
//    //Determining the size of region shown in the app upon launch
//    func centerMapOnLocation(location: CLLocation) {
//
//        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
//
//        mapView.setRegion(coordinateRegion, animated: true)
//
//    }
//
//    //Tells map to center
//    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//
//        if let loc = userLocation.location {
//
//            //Makes sure the map doesn't keep recentering while someone is walking and trying to pan to find pokemon
//            if !mapHasCenteredOnce {
//                centerMapOnLocation(location: loc)
//                mapHasCenteredOnce = true
//            }
//        }
//    }
//
////    //Replace blue dot with Ash for user location. viewFor annotation is where you'll do all customization for setting down pins in mapViews.
////    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
////
////        let annoIdentifier = "Pokemon"
////        var annotationView: MKAnnotationView?
////
////        if annotation.isKind(of: MKUserLocation.self) {
////
////            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
////            annotationView?.image = UIImage(named: "Ash")
////
////          //Reuse annotations if needed
////        } else if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier) {
////
////            annotationView = deqAnno
////            annotationView?.annotation = annotation
////
////          //Create a new annotation if we can't reuse one
////        } else {
////
////            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
////
////            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
////            annotationView = av
////        }
////
////
////        if let annotationView = annotationView, let anno = annotation as? PokeAnnotation {
////
////            annotationView.canShowCallout = true
////            annotationView.image = UIImage(named: "\(anno.pokemonNumber)")
////
////            //This make the image a button.
////            let btn = UIButton()
////            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
////            btn.setImage(UIImage(named: "map"), for: .normal)
////            annotationView.rightCalloutAccessoryView = btn
////        }
////
////
////        return annotationView
////    }
//
//    func createSighting(forLocation location: CLLocation, withPokemon pokeId: Int) {
//
//        geoFire.setLocation(location, forKey: "\(pokeId)")
//    }
//
////    func showSightingsOnMap(location: CLLocation) {
////        let circleQuery = geoFire!.query(at: location, withRadius: 2.5)
////
////        //The _ is if you don't want a result to a variable.
////        _ = circleQuery?.observe(GFEventType.keyEntered, with: { (key, location) in
////
////            //This gets called for amount of pokemon (151 times).
////            //We are renaming the former key variable from the line above to the latter key variable in the line below so if we reference it in the local scope, it won't access it in the outer scope.
////            if let key = key, let location = location {
////                //Passing in the pokeNumber and location coordinates so when it shows on the map, it drops the pokemon image.
////                let anno = PokeAnnotation(coordinate: location.coordinate, pokemonNumber: Int(key)!)
////                self.mapView.addAnnotation(anno)
////            }
////        })
////    }
//
////    //Updates the map as the user pans
////    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
////        //Grabbing center location for wherever the user just scrolled
////        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
////
////        showSightingsOnMap(location: loc)
////    }
//
////    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
////
////        //Pulls up Apple maps to take you to selected location
////        if let anno = view.annotation as? PokeAnnotation {
////
////            let place = MKPlacemark(coordinate: anno.coordinate)
////            let destination = MKMapItem(placemark: place)
////            destination.name = "Pokemon Sighting"
////            let regionDistance: CLLocationDistance = 1000
////            let regionSpan = MKCoordinateRegionMakeWithDistance(anno.coordinate, regionDistance, regionDistance)
////
////            //Configuring map before opening
////            let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span), MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] as [String : Any]
////
////            //Open up maps with the presets listed above
////            MKMapItem.openMaps(with: [destination], launchOptions: options)
////        }
////    }
////
////    @IBAction func spotRandomPokemon(_ sender: AnyObject) {
////
////        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
////        let rand = arc4random_uniform(151) + 1
////        createSighting(forLocation: loc, withPokemon: Int(rand))
////
////    }
//
//
//
//
//
//
//
//
//
//}
