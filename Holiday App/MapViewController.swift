//
//  MapViewController.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/16/20.
//

import UIKit
import MapKit
import Contacts



class MapViewController: UIViewController {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var artworks: [Artwork] = []
    
    fileprivate let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        
        
        
        let coords = locationManager.location != nil ?
            locationManager.location!.coordinate :
            CLLocationCoordinate2D()
            
        
        let initialLocation = CLLocation(latitude: coords.latitude, longitude: coords.longitude)
        
        mapView.centerToLocation(initialLocation)
        
        
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
        
        mapView.delegate = self
        print(artworks)
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    
    private func loadInitialData() {
      // 1
        if let file = Bundle.main.url(forResource: "PublicArt", withExtension: "geojson") {
        
          do {
            
            let artworkData = try Data(contentsOf: file)
            // 2
            let features = try MKGeoJSONDecoder()
              .decode(artworkData)
              .compactMap { $0 as? MKGeoJSONFeature }
            // 3
            let validWorks = features.compactMap(Artwork.init)
            // 4
            artworks.append(contentsOf: validWorks)
          } catch {
            // 5
            print("Unexpected error: \(error).")
          }
        }
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 5000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

extension MapViewController: MKMapViewDelegate {
  // 1
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? Artwork else {
      return nil
    }
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
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
      guard let artwork = view.annotation as? Artwork else {
        return
      }

      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
      ]
      artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}


