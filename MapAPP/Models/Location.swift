//
//  Location.swift
//  MapAPP
//
//  Created by Apple on 23/10/2022.
//

import Foundation
import MapKit



struct Location: Identifiable,Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    let name:String
    let cityname: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imagename: [String]
    
    
    let link:String
    
    
    
    
  var  id: String {
    
    name + cityname
    }
    
    
    
}
