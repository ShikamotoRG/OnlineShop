//
//  ContactsView.swift
//  OnlineShop
//
//  Created by Rafael on 07/07/2023.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
        Text("""




Company name: 
AS "YourDreamСlothes"
                
Address:
Latvia, Riga, Lubanas iela 78
                
Contacts:
+371 29718618
+371 64719843
                
e-mail:
YourDreamСlothes@test.lv
                
                
""")
        }
        
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
