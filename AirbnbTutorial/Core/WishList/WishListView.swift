//
//  WishListView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/17/23.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing:30){
                //            VStack {
                //                Text("Wishlist")
                //                    .font(.largeTitle)
                //                .bold()
                //            }
                //            .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Log in to view your wishlist")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("You can create, view or edit wishlist once you're logged in")
                        .font(.footnote)
                }
               .padding()
                
                
                Button{
                    //action
                    print("log in")
                    
                }label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishListView()
}
