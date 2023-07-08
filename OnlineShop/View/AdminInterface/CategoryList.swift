//
//  CategoryList.swift
//  OnlineShop
//
//  Created by Rafael on 07/07/2023.
//

import SwiftUI

struct CategoryList: View {
    
    @State private var jacketsViewIsOn = false
    @State private var tshirtsViewIsOn = false
    @State private var pantsViewIsOn = false
    @State private var beltsViewIsOn = false
    @State private var shoesViewIsOn = false
    @State private var close = false
    @Environment(\.presentationMode) private var presentationMode
    
    
    let categoryList = ["Jacket", "T-Shirt", "Pants", "Belts", "Shoes"]
    
    var body: some View {
        VStack {
            
            NavigationStack {
                List {
                    Button {
                        self.jacketsViewIsOn.toggle()
                    } label: {
                        Text("Jacket")
                    }
                    
                    Button {
                        self.tshirtsViewIsOn.toggle()
                    } label: {
                        Text("T-Shirt")
                    }
                    
                    Button {
                        self.pantsViewIsOn.toggle()
                    } label: {
                        Text("Pants")
                    }
                    
                    Button {
                        self.beltsViewIsOn.toggle()
                    } label: {
                        Text("Belt")
                    }
                    
                    Button {
                        self.shoesViewIsOn.toggle()
                    } label: {
                        Text("Shoes")
                    }
                }
                .navigationDestination(isPresented: $jacketsViewIsOn) {
                    AddJacketProductView()
                }
                .navigationDestination(isPresented: $tshirtsViewIsOn) {
                    AddTshirtProductView()
                }
                .navigationDestination(isPresented: $pantsViewIsOn) {
                    AddPantsProductView()
                }
                .navigationDestination(isPresented: $beltsViewIsOn) {
                    AddBeltsProductView()
                }
                .navigationDestination(isPresented: $shoesViewIsOn) {
                    AddShoesProductView()
                }
            }
            Button {
                close.toggle()
            } label: {
                Text("Close")
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
        }
        .foregroundColor(.black)
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
