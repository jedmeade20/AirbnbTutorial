//
//  ListingDetailView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/15/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing:Listing){
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "San Francisco" ? .sanFrancisco: .miamiFL,
            span:MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView{
            ZStack (alignment: .topLeading){
                ListingImageCaroselView(listing: listing)
                    .frame(height: 320)
                
                Button{
                    dismiss()
                }label: {
                    //back button image in button
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(45)
                }

            }
            //Header
            VStack(alignment: .leading, spacing: 8){
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                        
                        Text("29 Reviews")
                            .underline()
                        
                    }
                    .font(.caption)
                    
//                    Text("\(listing.state)", "\()")
//                        .font(.caption)
                    
                    
                }
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //host info View
            HStack{
                VStack(alignment: .leading){
                    
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    HStack{
                        Text("\(listing.numOfGuest) guests")
                        Text("\(listing.numOfBeds) beds")
                        Text("\(listing.numOfBedrooms) bedrooms")
                        Text("\(listing.numOfBathrooms) baths")
                    }
                    .font(.caption)
                    
                }
                .frame(width: 250,alignment: .leading)
                Spacer()
                
                Image("\(listing.ownerImageURl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            //Badges received, loops through each feature and prints icon and text that goes with it
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features){feature in
                    HStack(spacing: 12){
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading){
                            Text("\(feature.title)")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("\(feature.subtitle)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            //where you'll sleep
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                //horizontal scroller
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(1 ... listing.numOfBeds, id: \.self){ bedroom in
                            VStack(){
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            //building frame for image and text
                            .frame(width: 132, height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                //snaps scroll view back if not on proper image
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            //what this place offers
            VStack(alignment: .leading,spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities){ amenities in
                    HStack{
                        Image(systemName: amenities.imageName)
                            .frame(width: 32)
                        
                        Text("\(amenities.title)")
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            VStack(alignment: .leading,spacing: 16){
                 Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        //pushing everything on view to top
        .ignoresSafeArea()
        
        //so bottom of scrollview doesnt get blocked by overlay
        .padding(.bottom, 62)
        
        //adds sticky feature to view
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment: .leading){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                        Text("Oct 10 - 15")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .font(.caption)
                    
                    Spacer()
                    
                    Button{
                        
                    }label:{
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
            
        }
    }
}
#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
