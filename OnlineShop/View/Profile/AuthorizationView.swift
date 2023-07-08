//
//  AuthorizationView.swift
//  OnlineShop
//
//  Created by Rafael on 03/07/2023.
//

import SwiftUI

struct AuthorizationView: View {
    
    @State private var isAuthorization = false
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Profile authorization!")
                .padding()
                .padding(.horizontal, 25)
                .background().opacity(0.7)
                .cornerRadius(25)
            
            VStack {
                
                HStack {
                    Image(systemName: "envelope")
                    TextField("Insert email", text: $email)
                    
                }
                .padding()
                .background()
                .cornerRadius(15)
                .padding(8)
                .padding(.horizontal, 12)
                
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Insert password", text: $password)
                }
                .padding()
                .background()
                .cornerRadius(15)
                .padding(8)
                .padding(.horizontal, 12)
                
                
                Button {
                    AuthService.shared.signIn(email: self.email,
                                              password: self.password) { result in
                        switch result {
                        case .success(_):
                            isTabViewShow.toggle()
                        case .failure(let error):
                            alertMessage = "Authorization error: \(error.localizedDescription)"
                            isShowAlert.toggle()
                        }
                    }
                    
                } label: {
                    Text("Sign In")
                        .padding()
                        .padding(.horizontal, 30)
                        .background()
                        .cornerRadius(25)
                        .foregroundColor(.black)
                }
                
                HStack {
                    Image(systemName: "person.badge.plus")
                    
                    Button {
                        self.isAuthorization.toggle()
                        
                    } label: {
                        Text("Create an account")
                        
                    }.sheet(isPresented: $isAuthorization) {
                        RegistrationView()
                    }
                }
                .padding(8)
                .padding(.horizontal, 30)
                .background()
                .cornerRadius(25)
                .foregroundColor(.black)
                .padding(.top, 25)
            }
            
            Spacer()
            
        }
        
        .background(Image("clothes1").ignoresSafeArea(.all))
        .fullScreenCover(isPresented: $isTabViewShow) {
            if AuthService.shared.currentUser?.uid == "wG5sHEIALEMruz9GIxUmd6FTeao1" {
                AdminOrdersView()
            } else {
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                
                MainTabView(viewModel: mainTabBarViewModel)
            }
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
