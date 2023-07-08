//
//  AddProductView.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//
/*
import SwiftUI

struct AddProductView: View {
        
        @State private var showImagePicker = false
        @State private var image = UIImage(named: "none")!
        @State private var title: String = ""
        @State private var price: Int? = nil
        @State private var description: String = ""
        @Environment (\.dismiss) var dismiss
        
        var body: some View {
            VStack {
                ZStack {
                    HStack {
                        Text("Tap to add image")
                        Image(systemName: "doc.badge.plus")
                    }
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .onTapGesture {
                            showImagePicker.toggle()
                    }
                }
                TextField("Product name.", text: $title)
                    .padding()
                TextField("Product price", value: $price, format: .number)
                    .keyboardType(.numberPad)
                    .padding()
                TextField("Product description.", text: $description)
                    .padding()
                
                Spacer()
                
                Button {
                    guard let price = price else {
                        print("Information is unaviable")
                        return
                    }
                    let product = Product(id: UUID().uuidString, title: title, price: price, description: description)
                    guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                    DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                        switch result {
                        case .success(let product):
                            print(product.title)
                            dismiss()
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Save")
                        .padding()
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .background(LinearGradient(colors: [.blue, .mint], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                }
                
            }
            .padding()
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
            }
//            .background(Color.blue.opacity(0.2))
            .background(Color.gray.opacity(0.2))
        }
    }

    
    
    struct AddProductView_Previews: PreviewProvider {
        static var previews: some View {
            AddProductView()
        }
    }
*/
