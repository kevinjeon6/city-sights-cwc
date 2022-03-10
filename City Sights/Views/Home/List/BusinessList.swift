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
                
                
                BusinessSectionView(title: "Restaurants", businesses: model.restaurants)
                BusinessSectionView(title: "Sights", businesses: model.sights)
               
  
                
            }//Lazy Vstack
        }//Scrollview
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
