//
//  ProductDetailView.swift
//  OnlineShop
//
//  Created by Rafael on 02/07/2023.
//


/*
 import SwiftUI
 
 
 struct ProductDetailView: View {
 
 @State private var size = ""
 @State private var count = 1
 
 @Environment(\.presentationMode) var presentationMode
 
 var viewModel: ProductDetailViewModel
 
 var body: some View {
 VStack {
 Image("pants1")
 .resizable()
 .aspectRatio(contentMode: .fit)
 .cornerRadius(20)
 .frame(maxWidth: .infinity, maxHeight: 360)
 
 
 HStack {
 Text("\(viewModel.product.title)")
 Text("\(viewModel.getPrice(size: size)) eur")
 }
 
 Text(viewModel.product.description)
 
 Picker("Size", selection: $size) {
 ForEach(viewModel.size, id: \.self) { size in
 Text(size)
 }
 
 }
 .pickerStyle(.segmented)
 .padding()
 
 
 HStack {
 Stepper("Count", value: $count, in: 1...10)
 Text("\(count)")
 }
 .padding(.horizontal, 90)
 
 Spacer()
 
 Button {
 var position = Position(id: UUID().uuidString, product: viewModel.product, count: self.count)
 position.product.price = viewModel.getPrice(size: size)
 CartViewModel.shared.addPosition(position)
 presentationMode.wrappedValue.dismiss()
 
 } label: {
 Text("Add to cart")
 .foregroundColor(.black)
 }
 .padding(.horizontal, 30)
 .padding(.vertical)
 .background(.green)
 .cornerRadius(30)
 
 .onAppear {
 self.viewModel.getImage()
 }
 
 Spacer()
 
 
 }
 .foregroundColor(.black)
 .background(Color.gray.opacity(0.2))
 }
 }
 
 struct ProductDetailView_Previews: PreviewProvider {
 static var previews: some View {
 ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
 title: "Pants",
 imageUrl: "none",
 price: 49,
 description: "Style pants")))
 }
 }
 
 */
