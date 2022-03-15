//
//  YelpAttribution.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/15/22.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    var body: some View {
        Link(destination: URL(string: link)!) {
            Image("yelp")
        }
    }
}

struct YelpAttribution_Previews: PreviewProvider {
    static var previews: some View {
        YelpAttribution()
    }
}
