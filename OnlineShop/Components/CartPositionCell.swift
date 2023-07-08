//
//  PositionCell.swift
//  OnlineShop
//
//  Created by Rafael on 03/07/2023.
//

import SwiftUI

struct CartPositionCell: View {
    
    @State var uiImage = UIImage(named: "none")
    @State var viewModel = ProductDetailViewModel(product: Product(id: "1",
                                                                   title: "Pants",
                                                                   imageUrl: "none",
                                                                   price: 49,
                                                                   description: "Style pants"))
    let position: Position
    
    var body: some View {
        
        HStack {
            Image(uiImage: self.uiImage!)
//            Image("jacket")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.25)
//                .clipped()
                .cornerRadius(16)
                .frame(width: screen.width * 0.20, height: screen.width * 0.35)
            VStack(alignment: .leading) {
                Text(position.product.title)
                    .padding(.bottom, 4)
                Text("\(position.count) item")
                    .padding(.bottom, 4)
                Text("\(position.cost) eur")
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            Spacer()
                .onAppear {
                    self.viewModel.getShoes()
                }

        }
        .padding(.horizontal, 30)
    }
}

struct CartPositionCell_Previews: PreviewProvider {
    static var previews: some View {
        CartPositionCell(position: Position(id: UUID().uuidString,
                                            product: Product(id: UUID().uuidString,
                                                             title: "Jacket",
                                                             imageUrl: "none",
                                                             price: 69,
                                                             description: "Leather jacket"),
                                            count: 3))
    }
}
