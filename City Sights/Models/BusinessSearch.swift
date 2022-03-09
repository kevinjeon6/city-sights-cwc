//
//  BusinessSearch.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/9/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    //Empty Business array is the struct type we just created
    var businesses = [Business]()
    var total = 0
    var region = Region()
}


struct Region: Decodable {
    var center = Coordinate()
}
