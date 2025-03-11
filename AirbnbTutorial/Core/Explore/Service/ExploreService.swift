//
//  ExploreService.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/19/23.
//

import Foundation
class ExploreService{
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
