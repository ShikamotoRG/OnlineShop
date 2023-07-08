//
//  ShoesScreenView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct ShoesScreenView: View {
    
    @StateObject var viewModel = ProductViewModel()
    
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            Section {
                LazyVGrid(columns: layout) {
                    ForEach(viewModel.shoes, id: \.id) { product in
                        NavigationLink {
                            let viewModel = ProductDetailViewModel(product: product)
                            ShoesDetailView(viewModel: viewModel)
                        } label: {
                            ShoesCell(product: product)
                        }
                    }
                }
            }
        }
        .foregroundColor(.black)
        .background(Color.gray.opacity(0.2))
        .onAppear {
            self.viewModel.getShoesProducts()
        }
    }
}

struct ShoesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ShoesScreenView()
    }
}
