//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/15/23.
//

import SwiftUI

struct ListingItemView: View {
    //type Listing model
    let listing : Listing
    var body: some View {
        VStack(spacing: 8){
            
            //images pulled from array
            ListingImageCaroselView(listing: listing)
                .frame(height:300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack(alignment: .top){
                
                //listing information
                VStack(alignment: .leading){
                    
                    Text("\(listing.title)")
                        .foregroundStyle(.black)
                        .bold()
                    
                    Text("\(listing.city),\(listing.state)")
                        .foregroundStyle(.black)
                        .bold()
                    
                    HStack{
                        Text("\(listing.pricePerNight)")
                            .foregroundStyle(.black)
                            .bold()
                        Text("per night")
                            .foregroundStyle(.black)
                    }
                }
                .font(.footnote)
                
                Spacer()
                
                //rating here
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                        .font(.footnote)
                    
                }
                .foregroundStyle(.black)
            }
            
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
