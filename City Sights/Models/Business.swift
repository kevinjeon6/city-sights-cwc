//
//  Business.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/9/22.
//

import Foundation

//Business is the main struct because the key is Business and the value is an array containing other key-value pairs.
class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    //Data that we are downloading from the imageUrl
    
    var id: String?
    var alias: String?
    var name: String?
    var imageUrl: String
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var displayPhone: String?
    var phone: String?
    var distance: Double?
    
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData(){
        guard imageUrl != nil else {
            return
        }
        
        if let url = URL(string: imageUrl) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    DispatchQueue.main.async {
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
    
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
    var zipCode: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "zip_code"
        case displayAddress = "display_address"
        case city
        case country
        case address1
        case address2
        case address3
        case state
    }
}
