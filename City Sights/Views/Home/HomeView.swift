//
//  HomeView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/10/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            NavigationView{
                if !isMapShowing {
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text("Pittsburgh")
                            Spacer()
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                        }//HStack
                        Divider()
                        BusinessList()
                        
                    }
                    .padding([.horizontal, .top])//Vstack
                    .navigationBarHidden(true)
                } else {
                    BusinessMap()
                        .ignoresSafeArea()
                }
            }//NavigationView
            
        } else {
            ProgressView()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
