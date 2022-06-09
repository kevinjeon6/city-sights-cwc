//
//  BusinessTitle.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/13/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(business.name!)
                .font(.title2)
                .bold()
                
            
            if business.location?.displayAddress != nil{
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                        
                }
            }
                
            
            //Rating
            Image("regular_\(business.rating ?? 0)")
        }
        
    }//Vstack
}

