//
//  LocationsView.swift
//  MapAPP
//
//  Created by Apple on 23/10/2022.
//

import SwiftUI
import MapKit
struct LocationsView: View {
  @EnvironmentObject private var vm: LocationViewModel
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
            
                .ignoresSafeArea()
            
            VStack{
            
               headerview
            Spacer()
                ZStack{
                    ForEach(vm.locations) {
                        Location  in
                        
                        if vm.maploacations == Location {
                            LocationPreviewView(location: Location)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                        }
                    }
                }
            
            }
        }
     
        .sheet(item: $vm.showLoactionList, onDismiss: nil) { location in
            LocationDetailViewModel( location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(LocationViewModel())
    }
}

extension LocationsView {
    
    var  headerview: some View {
        VStack {
        
        HStack{
            Button{
                vm.TogglelistView()
            }label:{
            Image(systemName: "arrow.down")
                .padding()
                .rotationEffect(Angle(degrees:  vm.ShowlistView ? 180: 0))
            }
            Spacer()
            Text(vm.maploacations.name)
                .fontWeight(.bold)
                .animation(.none, value: vm.locations)
            Text(vm.maploacations.cityname)
                .fontWeight(.bold)
                .animation(.none, value: vm.locations)
            Spacer()
            
        }
            
        .font(.title2)
         
        .frame(maxWidth:.infinity)
        .frame(height: 55)
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 25)
        .padding()
            
            if vm.ShowlistView {
            LocationListView()
            }
        }
    }
    
    
    
}
