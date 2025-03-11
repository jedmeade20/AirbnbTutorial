//
//  Listing.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/18/23.
//

import Foundation

//used to allow poster to fill out information on main page
struct Listing: Identifiable, Codable, Hashable{
    //user info
    let id: String
    let userID: String
    let ownerName: String
    let ownerImageURl: String
    
    //house featuers
    let numOfBedrooms: Int
    let numOfBeds: Int
    let numOfBathrooms: Int
    let numOfGuest: Int
    
    //other info
    let title: String
    var rating: Double
    var pricePerNight: Int
    var imageURLsl: [String] 
    
    //address info
    let address: String
    let latitude: Double
    let longitude: Double
    let city: String
    let state: String
    
    var features : [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
}

//used for features attatched
enum ListingFeatures: Int, Codable, Identifiable, Hashable{
    case selfCheckIn
    case superHost
    
    var imageName: String{
        switch self{
        case.selfCheckIn: return "door.left.hand.open"
        case.superHost: return "medal"
        }
    }
    var title: String{
        switch self{
            case.selfCheckIn: return "self check-in"
            case.superHost: return "SuperHost"
        }
    }
    var subtitle: String{
        switch self{
            case.selfCheckIn: return "Check yourself in with the keypad"
            case.superHost: return "SuperHost are experienced, highly rated host who are committed to providing great stars for guests"
        }
    }
    
    var id: Int{return self.rawValue}
}

enum ListingAmenities: Int, Codable,Identifiable,Hashable {
    case pool
    case wifi
    case kitchen
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String{
        switch self {
            case .pool: return "Pool"
            case .kitchen: return "Kitchen"
            case .wifi: return "Wifi"
            case .laundry: return "Laundry"
            case .tv: return "TV"
            case .alarmSystem: return "Alarm System"
            case .office: return "Office"
            case .balcony: return "Balcony"
        }
    }
    
    var imageName: String{
        switch self{
            case .pool: return "figure.pool.swim"
            case .kitchen: return "fork.knife"
            case .wifi: return "wifi"
            case .laundry: return "washer"
            case .tv: return "tv"
            case .alarmSystem: return "checkerboard.shield"
            case .office: return "pencil.and.ruler.fill"
            case .balcony: return "building"
        }
    }
    var id: Int {return self.rawValue }
}
enum ListingType: Int, Codable,Identifiable,Hashable {
    
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String{
        switch self{
        case .apartment: return "Apartment"
        case.house: return "House"
        case.townHouse: return "TownHouse"
        case.villa: return "Villa"
        }
    }
    var id: Int {return self.rawValue}
}
