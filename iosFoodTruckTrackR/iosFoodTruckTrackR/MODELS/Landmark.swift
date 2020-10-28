//
//  Landmark.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/20/20.
//

import MapKit
import Foundation

class Landmark: NSObject, MKAnnotation {
    
    var foodtruckOperator: LoginController?
    var coordinate: CLLocationCoordinate2D
    let name: String
    let cuisine: String
    var title: String? {
        return name
    }
    
    var subtitle: String? {
        return cuisine
    }
    
    init(coordinate: CLLocationCoordinate2D, name: String, cuisine: String) {
        self.coordinate = coordinate
        self.name = name
        self.cuisine = cuisine
    }
    
    
    
}

