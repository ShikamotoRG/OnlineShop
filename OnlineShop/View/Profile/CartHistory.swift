//
//  CartHistory.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import SwiftUI

struct CartHistory: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        List {
            
            
            if viewModel.orders.count == 0 {
                Text("Your orders will be here")
            } else {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                }
            }
            
            
        }
        .listStyle(.plain)
        .onAppear {
            
            self.viewModel.getOrders()
        }
    }
}

struct CartHistory_Previews: PreviewProvider {
    static var previews: some View {
        CartHistory(viewModel: ProfileViewModel(profile: FBUser(id: "",
                                                                name: "Some Name",
                                                                phone: 482368,
                                                                address: "Some address")))
    }
}
