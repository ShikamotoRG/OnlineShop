//
//  BeltsScreenView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct BeltsScreenView: View {
    
    @StateObject var viewModel = ProductViewModel()
    
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            Section {
                LazyVGrid(columns: layout) {
                    ForEach(viewModel.belts, id: \.id) { product in
                        NavigationLink {
                            let viewModel = ProductDetailViewModel(product: product)
                            BeltsDetailView(viewModel: viewModel)
                        } label: {
                            BeltCell(product: product)
                        }
                    }
                }
            }
        }
        .foregroundColor(.black)
        .background(Color.gray.opacity(0.2))
        .onAppear {
            self.viewModel.getBeltsProducts()
        }
    }
}

struct BeltsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BeltsScreenView()
    }
}
