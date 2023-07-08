//
//  AdminOrderView.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderVoewShow = false
    @State var isShowAuthView = false
    @State private var isShowAddProductView = false
    
    
    var body: some View {
        
        VStack {
            
            
            HStack {
                Button {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Exit")
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal)
                        .background()
                        .cornerRadius(25)
                }
                
                Spacer()
                
                Button {
                    isShowAddProductView.toggle()
                } label: {
                    Text("Edd")
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal)
                        .background()
                        .cornerRadius(25)
                }
                
                
                
                
                
                Spacer()
                
                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Refresh")
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal)
                        .background()
                        .cornerRadius(25)
                }
            }
            .padding(.horizontal)
            
            
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderVoewShow.toggle()
                        }
                }
            }
            .listStyle(.plain)
            //.background(Color.blue.opacity(0.2))
            .onAppear {
                viewModel.getOrders()
            }
            .sheet(isPresented: $isOrderVoewShow) {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                OrderView(viewModel: orderViewModel)
            }
        }
        .fullScreenCover(isPresented: $isShowAuthView) {
            AuthorizationView()
        }
        .fullScreenCover(isPresented: $isShowAddProductView, content: {
            CategoryList()
        })
        
//        .sheet(isPresented: $isShowAddProductView) {
//            CategoryList()
//        }
        
        
    }
}



struct AdminOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
