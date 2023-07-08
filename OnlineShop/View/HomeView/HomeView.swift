//
//  HomeView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var jacketsViewIsOn = false
    @State private var tshirtsViewIsOn = false
    @State private var pantsViewIsOn = false
    @State private var beltsViewIsOn = false
    @State private var shoesViewIsOn = false
    
    @State var viewModel: ProductDetailViewModel
    
    
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Section {
                    LazyVGrid(columns: layout) {
                        Button {
                            self.jacketsViewIsOn.toggle()
                        } label: {
                            VStack {
//                                Image(uiImage: self.viewModel.image)
                                Image("jacket")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: screen.width * 0.45)
                                    .clipped()
                                    .cornerRadius(16)
                                Text("Jacket")
                            }
                            .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
                            .shadow(radius: 8)
                        }
                        
                        
                        Button {
                            self.tshirtsViewIsOn.toggle()
                        } label: {
                            VStack {
//                                Image(uiImage: self.viewModel.image)
                                Image("tshirt")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: screen.width * 0.45)
                                    .clipped()
                                    .cornerRadius(16)
                                Text("T-Shirt")
                            }
                            .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
                            .shadow(radius: 8)
                        }
                        
                        Button {
                            self.pantsViewIsOn.toggle()
                        } label: {
                            VStack {
//                                Image(uiImage: self.viewModel.image)
                                Image("pants")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: screen.width * 0.45)
                                    .clipped()
                                    .cornerRadius(16)
                                Text("Pants")
                            }
                            .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
                            .shadow(radius: 8)
                        }
                        
                        Button {
                            self.beltsViewIsOn.toggle()
                        } label: {
                            VStack {
//                                Image(uiImage: self.viewModel.image)
                                Image("belt")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: screen.width * 0.45)
                                    .clipped()
                                    .cornerRadius(16)
                                Text("Belt")
                            }
                            .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
                            .shadow(radius: 8)
                        }
                        
                        Button {
                            self.shoesViewIsOn.toggle()
                        } label: {
                            VStack {
//                                Image(uiImage: self.viewModel.image)
                                Image("shoes")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: screen.width * 0.45)
                                    .clipped()
                                    .cornerRadius(16)
                                Text("Shoes")
                            }
                            .frame(width: screen.width * 0.45, height: screen.width * 0.65, alignment: .center)
                            .shadow(radius: 8)
                        }

                        
                    }
                    .navigationDestination(isPresented: $jacketsViewIsOn) {
                        JacketsScreenView()
                    }
                    
                    .navigationDestination(isPresented: $tshirtsViewIsOn) {
                        TshirtScreeView()
                    }
                    
                    .navigationDestination(isPresented: $pantsViewIsOn) {
                        PantsScreenView()
                    }
                    .onAppear {
                        ProductViewModel.shared.getPantsProducts()
                    }
                    .navigationDestination(isPresented: $beltsViewIsOn) {
                        BeltsScreenView()
                    }
                    
                    .navigationDestination(isPresented: $shoesViewIsOn) {
                        ShoesScreenView()
                    }
                    
                    
                    .onAppear {
                        ProductViewModel.shared.getJacketProducts()
                    }
                    .onAppear {
                        ProductViewModel.shared.getTshirtProducts()
                    }
                    .onAppear {
                        ProductViewModel.shared.getPantsProducts()
                    }
                    .onAppear {
                        ProductViewModel.shared.getBeltsProducts()
                    }
                    .onAppear {
                        ProductViewModel.shared.getShoesProducts()
                    }
                    
                }
            }
        }
        .foregroundColor(.black)
        .background(Color.gray.opacity(0.2))
        
        
//        .onAppear {
//            ProductViewModel.shared.getJacketProducts()
//        }
//        .onAppear {
//            ProductViewModel.shared.getTshirtProducts()
//        }
//        .onAppear {
//            ProductViewModel.shared.getPantsProducts()
//        }
//        .onAppear {
//            ProductViewModel.shared.getBeltsProducts()
//        }
//        .onAppear {
//            ProductViewModel.shared.getShoesProducts()
//        }
        
     }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ProductDetailViewModel(product: Product(title: "", price: 15, description: "")))
    }
}
