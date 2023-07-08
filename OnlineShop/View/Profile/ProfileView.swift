//
//  ProfileView.swift
//  OnlineShop
//
//  Created by Rafael on 01/07/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isUserData = false
    @State private var isUserClientNetCard = false
    @State private var isFaviriteItem = false
    @State private var isCartHistory = false
    @State private var isLogOut = false
    @State private var isAuthorizationViewPresentad = false
    
    
    let profileCatecory = ["My data", "Smart NET Card", "Favorite Item", "Cart History", "LogOut"]
    
    var body: some View {
        VStack {
            
            NavigationStack {
                List {
                    Button("My data") {
                        self.isUserData.toggle()
                    }
                    Button("Smart NET Card") {
                        self.isUserClientNetCard.toggle()
                    }
                    Button("Favorite Item") {
                        self.isFaviriteItem.toggle()
                    }
                    Button("Cart History") {
                        self.isCartHistory.toggle()
                    }
                    Button("LogOut") {
                        self.isLogOut.toggle()
                        print("LogOut")
                    }
                    .confirmationDialog("Are you sure?", isPresented: $isLogOut) {
                        Button {
                            isAuthorizationViewPresentad.toggle()
                        } label: {
                            Text("Yes")
                        }

                    }
                    .fullScreenCover(isPresented: $isAuthorizationViewPresentad, onDismiss: nil) {
                        AuthorizationView()
                    }
                }
                .navigationDestination(isPresented: $isUserData) {
                    UserData(viewModel: ProfileViewModel(profile: FBUser(id: "", name: "Some name", phone: 54783581, address: "Some address")))
                }
                .navigationDestination(isPresented: $isUserClientNetCard) {
                    UserClientNetCard()
                }
                .navigationDestination(isPresented: $isFaviriteItem) {
                    FavoriteItem()
                }
                .navigationDestination(isPresented: $isCartHistory) {
                    CartHistory(viewModel: ProfileViewModel(profile: FBUser(id: "",
                                                                            name: "Some Name",
                                                                            phone: 482368,
                                                                            address: "Some address")))
                }
                
            }
            
            
            
       }
        .foregroundColor(.black)
        .background(Color.gray.opacity(0.2))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
