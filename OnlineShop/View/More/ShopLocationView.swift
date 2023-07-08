//
//  ShopLocationView.swift
//  OnlineShop
//
//  Created by Rafael on 07/07/2023.
//

import SwiftUI
import MapKit

struct ShopLocationView: View {
    
    @StateObject private var viewModel = ShopLocationViewModel()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.locations) { location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
            }
            .ignoresSafeArea()
        }
    }
}

struct ShopLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ShopLocationView()
    }
}


