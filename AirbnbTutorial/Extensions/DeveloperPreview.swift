//
//  DeveloperPreview.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/19/23.
//

import Foundation
class DeveloperPreview {
    static let shared = DeveloperPreview()
    //pre filled info for explore page
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            userID: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageURl: "male-profile-photo",
            
            numOfBedrooms: 4,
            numOfBeds: 3,
            numOfBathrooms: 4,
            numOfGuest: 4,
            
            title: "Desert Cottage",
            rating: 4.83,
            pricePerNight: 567, 
            imageURLsl: ["Listing-1","Listing-2","Listing-3","Listing-4",],
            
            address: "123 Main Street",
            latitude:25.7850,
            longitude:-80.1936,
            city:"Phoenix",
            state: "AZ",
            
            features: [.selfCheckIn],
            amenities: [.wifi, .pool, .kitchen, .laundry],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            userID: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageURl: "male-profile-photo",
            
            numOfBedrooms: 5,
            numOfBeds: 6,
            numOfBathrooms: 4,
            numOfGuest: 7,
            
            title: "Loft in the City",
            rating: 4.98,
            pricePerNight: 800,
            imageURLsl: ["Listing-3","Listing-1","Listing-2","Listing-4",],
            
            address: "123 Main Street",
            latitude:25.7850,
            longitude:-80.1936,
            city:"New York City",
            state: "NY",
            
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .pool, .kitchen, .laundry, .alarmSystem, .tv],
            type: .house
        ),
        .init(
            id: NSUUID().uuidString,
            userID: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageURl: "male-profile-photo",
            
            numOfBedrooms: 4,
            numOfBeds: 3,
            numOfBathrooms: 4,
            numOfGuest: 4,
            
            title: "Modern Getaway",
            rating: 4.83,
            pricePerNight: 567,
            imageURLsl: ["Listing-2","Listing-1","Listing-3","Listing-4",],
            
            address: "123 Main Street",
            latitude:25.7850,
            longitude:-80.1936,
            city:"San Francisco",
            state: "CA",
            
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .pool, .kitchen, .office],
            type: .house
        ), 
            .init(
                id: NSUUID().uuidString,
                userID: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImageURl: "male-profile-photo",
                
                numOfBedrooms: 4,
                numOfBeds: 3,
                numOfBathrooms: 4,
                numOfGuest: 4,
                
                title: "Desert Cottage",
                rating: 4.83,
                pricePerNight: 567,
                imageURLsl: ["Listing-1","Listing-2","Listing-3","Listing-4",],
                
                address: "123 Main Street",
                latitude:25.7850,
                longitude:-80.1936,
                city:"Phoenix",
                state: "AZ",
                
                features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .pool, .kitchen, .laundry],
                type: .house
            ),
            .init(
                id: NSUUID().uuidString,
                userID: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImageURl: "male-profile-photo",
                
                numOfBedrooms: 5,
                numOfBeds: 6,
                numOfBathrooms: 4,
                numOfGuest: 7,
                
                title: "Loft in the City",
                rating: 4.98,
                pricePerNight: 800,
                imageURLsl: ["Listing-3","Listing-1","Listing-2","Listing-4",],
                
                address: "123 Main Street",
                latitude:25.7850,
                longitude:-80.1936,
                city:"New York City",
                state: "NY",
                
                features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .pool, .kitchen, .laundry, .alarmSystem, .tv],
                type: .house
            ),
            .init(
                id: NSUUID().uuidString,
                userID: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImageURl: "male-profile-photo",
                
                numOfBedrooms: 4,
                numOfBeds: 3,
                numOfBathrooms: 4,
                numOfGuest: 4,
                
                title: "Modern Getaway",
                rating: 4.83,
                pricePerNight: 567,
                imageURLsl: ["Listing-2","Listing-1","Listing-3","Listing-4",],
                
                address: "123 Main Street",
                latitude:25.7850,
                longitude:-80.1936,
                city:"San Francisco",
                state: "CA",
                
                features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .pool, .kitchen, .office],
                type: .house
            )
    ]
}
