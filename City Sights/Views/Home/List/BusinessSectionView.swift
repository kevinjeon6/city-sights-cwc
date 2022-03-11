//
//  BusinessSectionView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/10/22.
//

import SwiftUI

struct BusinessSectionView: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                
                NavigationLink {
                    BusinessDetails(business: business)
                } label: {
                    BusinessRowView(business: business)
                }

                
           
              
            }
        }
    }
}


