//
//  TreeLotsMap.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/16/20.
//

import Foundation
import MapKit
import Contacts

class MapLot: NSObject, MKAnnotation {
    
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
    
  }
    
    init?(feature: MKGeoJSONFeature) {
      // 1
      guard let point = feature.geometry.first as? MKPointAnnotation,
        // 2
        let propertiesData = feature.properties,
        let json = try? JSONSerialization.jsonObject(with: propertiesData),
        let properties = json as? [String: Any]
        else {
          return nil
      }
      
      // 3
      title = properties["title"] as? String
      locationName = properties["location"] as? String
      discipline = properties["discipline"] as? String
      coordinate = point.coordinate
      super.init()
    }
    
  var subtitle: String? {
    return locationName
  }
    
    var mapItem: MKMapItem? {
      guard let location = locationName else {
        return nil
      }

      let addressDict = [CNPostalAddressStreetKey: location]
      let placemark = MKPlacemark(
        coordinate: coordinate,
        addressDictionary: addressDict)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = title
      return mapItem
    }
}
