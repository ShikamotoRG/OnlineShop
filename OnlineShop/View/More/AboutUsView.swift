//
//  AboutUsView.swift
//  OnlineShop
//
//  Created by Rafael on 07/07/2023.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
         Text("""
                                    About US

  YourDreamClothing is your source for fashion, beauty, celebrity, and lifestyle content that delights, informs, and entertains. If there's a new denim silhouette, you'll find it here — as well as a delicate explanation for why it might be stressing people out. We get first dibs on new beauty products and only share what's worth a try, with ingredient breakdowns and step-by-step routines to follow. We question everything and let you know which brands can back up their bona-fides ("clean" and "sustainable" are words that mean things, and we don't let anyone skate past with greenwashed jargon).

  Speaking of meaning: We mean it when we say "Everybody's In." On YourDreamClothing, fashion and beauty's best kept secrets are shared, and velvet-rope access opens wide with a joyful and celebratory ethos. Inclusivity — real, meaningful representation — is at the heart of everything we do, from our editorial team and freelance contributors, to the celebrity faces you see on our site and the brand founders, designers, and owners we choose to cover.

  Whether you're here to discover clothing trends, beauty looks, fitness fads, or for our analysis of the cultural moments behind all of that, we want you to see yourself reflected on our pages and leave (if you must) with a smile.
""")
            .padding(.horizontal, 4)
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
