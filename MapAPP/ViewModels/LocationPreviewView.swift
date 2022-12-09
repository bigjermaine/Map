//
//  LocationPreviewView.swift
//  MapAPP
//
//  Created by Apple on 23/10/2022.
//

import SwiftUI

struct LocationPreviewView: View {
    var location:Location
    @EnvironmentObject private var vm: LocationViewModel
    var body: some View {
        HStack(alignment:.bottom){
        VStack(alignment:.leading, spacing: 16.0) {
              picture
            
            VStack(alignment:.leading){
            Text(location.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text(location.cityname)
                    .font(.subheadline)
            }
            .frame(maxWidth:.infinity)
            
        }
        
            VStack(alignment:.leading){
            Button {
                vm.showLoactionList = location
            }label:{
                Text("Learn more")
                    .cornerRadius(8)
            }
            .buttonStyle(.borderedProminent)
            
         }
            .frame(maxWidth:.infinity)
        }
        .padding(20)
        .background(
            
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .offset(y:65)
            
            )
        .cornerRadius(12)
        .padding()
      }
    }

    

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}



extension LocationPreviewView {
    var  picture: some View {
ZStack {
    if let imageName = location.imagename.first {
 Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        
    }
    
}
.padding(6)
.background(Color.red)
.cornerRadius(10)
    }
    
    
    
    
    
    
}
