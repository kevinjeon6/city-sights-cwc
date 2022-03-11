//
//  BusinessDetails.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/11/22.
//

import SwiftUI

struct BusinessDetails: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            VStack(alignment: . leading, spacing: 0) {
                //Image. UIImage() is creating an empty image for nil coalising
            GeometryReader { geometry in
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea(.all, edges: .top)
      
                //Open or closed
            ZStack(alignment: . leading){
                    Rectangle()
                        .frame( height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.leading)
                }//Zstack
            }//Vstack
             
                
            Group {
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                
                if business.location?.displayAddress != nil{
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                            .padding(.horizontal)
                    }
                }
                    
                
                //Rating
                Image("regular_\(business.rating ?? 0)")
                    .padding()
             
                Divider()
                //Phone
                HStack {
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                Divider()
                //Reviews
                HStack{
                    Text("Reviews:")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                Divider()
                //Webside
                HStack {
                    Text("Website:")
                        .bold()
                    Text(business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                Divider()
                
            }//Group
                //Get Direction button
            Button {
                //TODO
            } label: {
                ZStack{
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                    
                }//Zstack
            }//Button
            .padding()

            }//Vstack
      
    }
}


