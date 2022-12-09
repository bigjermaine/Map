//
//  LocationViewModel.swift
//  MapAPP
//
//  Created by Apple on 23/10/2022.
//

import SwiftUI
import MapKit
struct LocationDetailViewModel: View {
    @EnvironmentObject private var vm: LocationViewModel
    let location:Location
    var body: some View {
        ScrollView{
       
            top
            
                
            .overlay(
                VStack{
                   
                backbutton
                }
                    .frame(maxWidth:.infinity,maxHeight:.infinity,alignment: .topLeading)
                    .padding()
                    
                    )
                
            VStack{
            titlesection
            Divider()
            Descriptionsection
            Divider()
            }
            .padding(.leading, 8)
        }
        .ignoresSafeArea()
    }
}

struct LocationDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailViewModel(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}

extension  LocationDetailViewModel {
    var top: some View {
VStack{
    TabView{
        ForEach(location.imagename, id:\.self) {
            Image($0)
                .resizable()
                .scaledToFill()
                .frame(maxWidth:UIScreen.main.bounds.width)
                .clipped()
            
        }
    }
    .frame(height:500)
    .tabViewStyle(PageTabViewStyle())
     }
  }
    
    var titlesection: some View {
    
    VStack(alignment:.leading) {
        Text(location.name)
            .font(.largeTitle)
            .fontWeight(.bold)
        Text(location.cityname)
            .font(.title3)
            .foregroundColor(.secondary)
    }
    .frame(maxWidth:.infinity,alignment: .leading)
    
    
 }
    
    var Descriptionsection: some View {
    
    VStack(alignment:.leading,spacing: 8) {
        Text(location.description)
            .font(.subheadline)
            .foregroundColor(.secondary)
        let url = URL(string: location.link)
        Link("Read more from wikipedia", destination: url!)
       
    }
    .frame(maxWidth:.infinity,alignment: .leading)
    
    
 }
   private   var maplayer2: some View {
          Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: vm.mapSpan)))
        
    }
    private var backbutton: some View {
        Button{
            vm.showLoactionList = nil
        } label: {
            
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
        }
         
     }
    
}
