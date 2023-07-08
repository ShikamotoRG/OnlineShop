//
//  PositionCell.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) gb")
            Text("\(position.cost) $")
                .frame(width: 85, alignment: .trailing)
                
        }
        .padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Grieku", imageUrl: "pizza3", price: 5, description: "Vistat gala, sampinjoni, peperoni pipari, mocarella, tomatu merce, elle, kiploku merce, oregano"), count: 3))
    }
}
