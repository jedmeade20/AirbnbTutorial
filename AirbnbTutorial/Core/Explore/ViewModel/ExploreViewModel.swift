//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/19/23.
//

import Foundation
class ExploreViewModel: ObservableObject {
    //array listi
    @Published var listings = [Listing]()
    @Published var searchDestination = ""
    private let service:  ExploreService
    private var newListings = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task{
            await fetchListing()
        }
    }

    func fetchListing() async {
        do{
            self.listings = try await service.fetchListings()
            self.newListings = listings
        }catch{
            print("debug failed to fetch listings with error: \(error.localizedDescription) ")
        }
    }
    func filterUserSearch(){
        let filteredResults = listings.filter({
            $0.city.lowercased() == searchDestination.lowercased() ||
            $0.state.lowercased() == searchDestination.lowercased()
        })
        self.listings = filteredResults.isEmpty ? newListings : filteredResults
    }
    
}
