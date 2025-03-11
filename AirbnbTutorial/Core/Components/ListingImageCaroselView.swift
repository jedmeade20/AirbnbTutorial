//
//  ListingImageCaroselView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/15/23.
//

import SwiftUI

struct ListingImageCaroselView: View {
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURLsl, id: \.self){  image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
        
    }
}

#Preview {
    ListingImageCaroselView(listing: DeveloperPreview.shared.listings[0])
}
