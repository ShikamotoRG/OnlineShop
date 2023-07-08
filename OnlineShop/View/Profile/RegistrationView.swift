//
//  RegistrationView.swift
//  OnlineShop
//
//  Created by Rafael on 03/07/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var isRegistration = false
    @State private var isProfile = false
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            Text("Registration")
                .padding()
                .padding(.horizontal, 25)
                .background().opacity(0.7)
                .cornerRadius(25)
            
            HStack {
                Image(systemName: "envelope")
                TextField("Enter your email", text: $email)
                
            }
            .padding()
            .padding(.horizontal, 25)
            .background().opacity(0.7)
            .cornerRadius(25)
            
            HStack {
                Image(systemName: "lock")
                SecureField("Enter your password", text: $password)
            }
            .padding()
            .padding(.horizontal, 25)
            .background().opacity(0.7)
            .cornerRadius(25)
            
            HStack {
                Image(systemName: "lock")
                SecureField("Confirm your password", text: $confirmPassword)
            }
            .padding(16)
            .padding(.horizontal, 25)
            .background().opacity(0.7)
            .cornerRadius(25)
            
            HStack {
                Image(systemName: "person.badge.plus")
                Button {
                    
                    guard password == confirmPassword else {
                        self.alertMessage = "Password doesn't match!"
                        self.isShowAlert.toggle()
                        return
                    }
                    
                    AuthService.shared.signUp(email: self.email, password: self.password) { result in
                        switch result {
                        case .success(let user):
                            
                            alertMessage = "You are registred with \(user.email!)"
                            self.isShowAlert.toggle()
                            self.email = ""
                            self.password = ""
                            self.confirmPassword = ""
                            
                        case .failure(let error):
                            alertMessage = "Registration error \(error.localizedDescription)"
                        }
                    }
                } label: {
                    Text("Create an account")

                    
                }
            }
            .padding(8)
            .padding(.horizontal, 30)
            .background()
            .cornerRadius(25)
            .foregroundColor(.black)
            .padding(.top, 25)
            
            HStack {
                Image(systemName: "xmark.circle")
                Button {
                    isRegistration.toggle()
                } label: {
                    Text("Close")
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .padding(8)
            .padding(.horizontal, 30)
            .background()
            .cornerRadius(25)
            .foregroundColor(.black)
            .padding(.top, 25)
            .alert(alertMessage, isPresented: $isShowAlert) {
                Button { } label: {
                    Text("Ok")
                }

            }
            
        }
        .padding(.horizontal)
        .background(Image("clothes1").edgesIgnoringSafeArea(.all))
    }
        
        
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
