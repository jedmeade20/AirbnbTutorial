//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/15/23.
//

import SwiftUI

struct ExploreView: View {
    //if true, show destination search view else show this page
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        //shows multiple views?
        NavigationStack{
            
            //if true show this else main page
            if showDestinationSearchView{
                //adds parameter that interacts with binding property on destination page
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            }else{
                //up/down page
                ScrollView{
                    
                    //loads listViewItem only when needed
                    SearchAndFilterBar(location: $viewModel.searchDestination)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing: 32){
                        //10 rectangles per page?
                        ForEach(viewModel.listings ){listing in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                        }
                    }
                }
                //int from for each, allows user to click into each listing based on 'id'
                .navigationDestination(for:Listing.self){ listing in
                    ListingDetailView(listing: listing )
                        //hides navigation bar so layout is flush
                        .navigationBarBackButtonHidden()
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
