//
//  MoreView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct MoreView: View {
    @State private var aboutUs = false
    @State private var contacts = false
    @State private var shopLocation = false

    
    
    let categoryList = ["About us", "Contacts", "Shop location"]
    
    var body: some View {
        VStack {
            
            NavigationStack {
                List {
                    Button {
                        self.aboutUs.toggle()
                    } label: {
                        Text("About us")
                    }
                    
                    Button {
                        self.contacts.toggle()
                    } label: {
                        Text("Contacts")
                    }
                    
                    Button {
                        self.shopLocation.toggle()
                    } label: {
                        Text("Shop location")
                    }
                  }
                .navigationDestination(isPresented: $aboutUs) {
                    AboutUsView()
                }
                .navigationDestination(isPresented: $contacts) {
                    ContactsView()
                }
                .navigationDestination(isPresented: $shopLocation) {
                    ShopLocationView()
                }
               }
            
        }
        .foregroundColor(.black)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
