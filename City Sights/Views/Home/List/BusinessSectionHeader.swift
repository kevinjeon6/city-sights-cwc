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
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }//Zstack
    }
}

