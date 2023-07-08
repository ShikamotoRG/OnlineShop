//
//  ProductCell.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct JacketCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "jacket")
    
    var body: some View {
        VStack {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            VStack {
                Text(product.title)
                Text("\(product.price) eur")
                Text(product.description)
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
            
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
        .shadow(radius: 8)
        .onAppear {
            StorageService.shared.downloadJacketImage(id: self.product.id) { result in
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

struct JacketCell_Previews: PreviewProvider {
    static var previews: some View {
        JacketCell(product: Product(id: "1", title: "Jacket", imageUrl: "none", price: 49, description: "Leather jacket"))
    }
}
