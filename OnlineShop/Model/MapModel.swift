//
//  MapModel.swift
//  OnlineShop
//
//  Created by Rafael on 08/07/2023.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


