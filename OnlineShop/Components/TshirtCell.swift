//
//  TshirtCcell.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct TshirtCell: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "none")
    
    var body: some View {
        VStack {
            Image(uiImage: uiImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            HStack {
                Text(product.title)
                Spacer()
                Text("\(product.price) eur")
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
            Text(product.description)
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
        .shadow(radius: 8)
        .onAppear {
            StorageService.shared.downloadTshirtImage(id: self.product.id) { result in
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

struct TshirtCcell_Previews: PreviewProvider {
    static var previews: some View {
        TshirtCell(product: Product(id: "1", title: "T-Shirt", imageUrl: "none", price: 49, description: "Cool T-Shirt"))
    }
}
