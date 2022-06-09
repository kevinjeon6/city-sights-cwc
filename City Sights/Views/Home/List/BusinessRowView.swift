//
//  BusinessRowView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/10/22.
//

import SwiftUI

struct BusinessRowView: View {
    //Need to pass the business to this view
   @ObservedObject  var business: Business
//make property observed object because as soon as data gets populated, we weant the row to react and pick up that change and render the image

    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
           
                VStack(alignment:.leading){
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format: "%.1f miles away", (business.distance ?? 0)/1609 ))
                        .font(.caption)
                    //%.1f is a floating point of one decimal place
                    
                }//Vstack
                Spacer()
                //Star rating and number of reviews
                VStack(alignment:.leading){
                    Image("regular_\(business.rating ?? 0.0)")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                }//Vstack
            }
            DashedDivider()
                .padding(.vertical)
        }//Vstack
        .foregroundColor(.black)
    }
}


