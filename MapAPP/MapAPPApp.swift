//
//  MapAPPApp.swift
//  MapAPP
//
//  Created by Apple on 22/10/2022.
//

import SwiftUI

@main
struct MapAPPApp: App {
    @StateObject  private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView().environmentObject(LocationViewModel())        }
    }
}
