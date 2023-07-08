//
//  ProductCell.swift
//  OnlineShop
//
//  Created by Rafael on 02/07/2023.
//

/*

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "jacket")!
    
    var body: some View {
        VStack {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            HStack {
                Text(product.title)
                Text("\(product.price) eur")
            }
            Text(product.description)
            
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
        .shadow(radius: 8)
        .onAppear {
            StorageService.shared.downloadProductImage(id: self.product.id) { result in
                switch result {
                case .success(let data):
                    if let img = UIImage(data: data) {
                        self.uiImage = img
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1", title: "pants", imageUrl: "none", price: 49, description: "Style pants"))
    }
}

*/
