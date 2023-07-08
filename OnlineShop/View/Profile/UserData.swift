//
//  UserData.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import SwiftUI

struct UserData: View {
    
    @State private var isAvatarAlertPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer()
            
           HStack(spacing: 16) {
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(8)
                    .background(Color("color"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvatarAlertPresented.toggle()
                    }
                    .confirmationDialog("Add foto...", isPresented: $isAvatarAlertPresented) {
                        
                        Button {
                            print("Library")
                        } label: {
                            Text("Galary")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("Camera")
                        }

                    }
                
               VStack(alignment: .leading, spacing: 12) {
                   TextField("Name Surname", text: $viewModel.profile.name)
                   
                   HStack {
                       Text("+371")
                       TextField("Phone number", value: $viewModel.profile.phone, format: .number)
                           
                   }
               }
            }
            
            VStack(alignment: .leading) {
                Text("Delivery address:")
                TextField("Your delivery address", text: $viewModel.profile.address)
            }
            
            List {
                //
            }
        }
        .onSubmit {
            viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
        .padding(.horizontal)
        
    }
}

struct UserData_Previews: PreviewProvider {
    static var previews: some View {
        UserData(viewModel: ProfileViewModel(profile: FBUser(id: "",
                                                             name: "Some person",
                                                             phone: 25843917,
                                                             address: "Add your address")))
    }
}
