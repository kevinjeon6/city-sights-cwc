//
//  BusinessSectionHeader.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/10/22.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 45)
            
            Text(title)
                .font(.headline)
        }//Zstack
    }
}

