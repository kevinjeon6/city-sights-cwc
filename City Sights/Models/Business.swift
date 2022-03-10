//
//  Business.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/9/22.
//

import Foundation

//Business is the main struct because the key is Business and the value is an array containing other key-value pairs.
struct Business: Decodable, Identifiable {
    
    var id: String?
    var alias: String?
    var name: String?
    var image_url: String
    var is_closed: Bool?
    var url: String?
    var review_count: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var distance: Double?
    
    
    
}


struct Category: Decodable {
    var alias: String?
    var title: String?
}


struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}


struct Location: Decodable {
    var city: String?
    var country: String?
    var address1: String?
    var address2: String?
    var address3: String?
    var state: String?
    var zip_code: String?
}
