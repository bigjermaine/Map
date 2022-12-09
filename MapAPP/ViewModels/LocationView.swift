//
//  LocationView.swift
//  MapAPP
//
//  Created by Apple on 23/10/2022.
//

import SwiftUI
import MapKit
import Foundation


class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    @Published var maploacations: Location {
    didSet {
        updateMapRegion(location: maploacations)
      }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var ShowlistView:Bool  = false
    @Published var nextShowlistView:Bool  = false
    
    @Published var showLoactionList: Location? = nil
    
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init(){
        let locations = LocationsDataService.locations
        
        self.locations = locations
        self.maploacations = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location) {
        
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan )
        
            
        
        }
    }
    
    
    func TogglelistView(){
        withAnimation(.easeInOut) {
        ShowlistView = !ShowlistView
        }
    }
    func nextShowlistView(location:Location) {
        withAnimation(.easeInOut) {
        maploacations = location
            ShowlistView = false
        }
    }
    
    
}
