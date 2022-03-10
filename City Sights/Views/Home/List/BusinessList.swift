//
//  BusinessList.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/10/22.
//

import SwiftUI

struct BusinessList: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){
                
                
                Section(header: BusinessSectionHeader(title: "Restaurants")){
                    ForEach(model.restaurants) { business in
                        Text(business.name ?? "")
                        Divider()
                    }
                }//Business section
               
                Section(header: BusinessSectionHeader(title: "Sights")){
                    
                    ForEach(model.sights) { business in
                        Text(business.name ?? "")
                        Divider()
                    }
                } //Sights section
                
            }//Lazy Vstack
        }//Scrollview
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
