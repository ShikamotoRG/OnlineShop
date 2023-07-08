//
//  OrderView.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//

import SwiftUI

struct OrderView: View {
    
        @StateObject var viewModel: OrderViewModel
    
        
        var statuses: [String] {
            var sts = [String]()
            for status in OrderStatus.allCases {
                sts.append(status.rawValue)
            }
            return sts
        }
        
        
        var body: some View {
            VStack(spacing: 8) {
                
                Text("\(viewModel.user.name)")
                    .font(.title3).bold()
                Text("+371 \(viewModel.user.phone)")
                Text("\(viewModel.user.address)")
            }
            .padding()
            .onAppear {
                viewModel.getUserData()
            }
            
            Picker(selection: $viewModel.order.status) {
                ForEach(statuses, id: \.self) { status in
                    Text(status)
                }
            } label: {
                Text("Order status")
            }
            .onChange(of: viewModel.order.status) { newValue in
                DatabaseService.shared.setOrder(order: viewModel.order) { result in
                    switch result {
                    case .success(let order):
                        print(order.status)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            .pickerStyle(.segmented)
            
            
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
            }
            
            
            HStack(alignment: .center ) {
                Text("Total: \(viewModel.order.cost) $")
            }
            
        }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "new")))
    }
}
