//
//  UserClientNetCard.swift
//  OnlineShop
//
//  Created by Rafael on 04/07/2023.
//

import SwiftUI

struct UserClientNetCard: View {
    var body: some View {
        VStack {
            Text("You can use this Smart Net cart for receiving discount")
            Image("smartNetCart")
                .resizable()
                
        }
        .background(Color("qacode"))
    }
}

struct UserClientNetCard_Previews: PreviewProvider {
    static var previews: some View {
        UserClientNetCard()
    }
}
