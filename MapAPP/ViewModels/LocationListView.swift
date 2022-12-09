//
//  LocationListView.swift
//  MapAPP
//
//  Created by Apple on 23/10/2022.
//

import SwiftUI
import MapKit
struct LocationListView: View {
    @EnvironmentObject private var vm: LocationViewModel
    var body: some View {
        List {
             
            ForEach(vm.locations){ Location in
                Button{
                    vm.nextShowlistView(location: Location)
                }label: {
                locationlistview(Location:Location)
                    .listRowBackground(Color.clear)
                    .foregroundColor(.brown)
                }
            }
        }
        .listStyle(PlainListStyle())
        
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView().environmentObject(LocationViewModel())
    }
}


extension  LocationListView {
    
    
    func locationlistview(Location:Location)-> some View {
        
        HStack{
            if let imageName = Location.imagename.first{
              Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment:.leading, spacing:0){
                Text(Location.name)
                    .font(.headline)
                Text(Location.cityname)
                    .font(.subheadline)
            }
            .frame(maxWidth:.infinity,alignment:.leading)
        }
        
    }
}
