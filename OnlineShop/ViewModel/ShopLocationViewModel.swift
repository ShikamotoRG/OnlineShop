//
//  ShopLocationViewModel.swift
//  OnlineShop
//
//  Created by Rafael on 08/07/2023.
//

import Foundation
import MapKit


class ShopLocationViewModel: ObservableObject {

    @Published var region: MKCoordinateRegion
    @Published var locations: [Location] = []
    
    init() {
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56.931068, longitude:  24.203610),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.locations.insert(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 56.931068, longitude:  24.203610)), at: 0)
    }
}

