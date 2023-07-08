//
//  CartView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                List(viewModel.positions, id: \.id) { position in
                    CartPositionCell(position: position)
                    
                        .swipeActions(allowsFullSwipe: false) {
                            
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("Add Favorite", systemImage: "heart")
                            }
                            .tint(.indigo)
                            
                            Button(role: .destructive) {
                                viewModel.positions.removeAll { pos in
                                    pos.id == position.id
                                }
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }.tint(.red)
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Cart")
           
            
            HStack {
                HStack {
                    Text("Total:")
                    Text("\(viewModel.cost) eur")
                }
                
                
                Spacer()
                
                Button {
                    print("Confirm")
                    
                    var order = Order(userID: AuthService.shared.currentUser!.uid,
                                      date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrder(order: order) { result in
                        switch result {
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                } label: {
                    Text("Confirm")
                }
                .foregroundColor(.black)
                .padding()
                .padding(.horizontal)
                .background(.green)
                .cornerRadius(35)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
