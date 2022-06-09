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
    @State var selectedBusiness: Business?
    
    
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            NavigationView{
                
                //Determine if we should show the list or map
                if !isMapShowing {
                    
                    //Show list
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location")
                            Text(model.placemark?.subLocality ?? "")
                            Spacer()
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                        }//HStack
                        Divider()
                        
                        ZStack(alignment: .top){
                            BusinessList()
                            
                            HStack{
                                Spacer()
                                YelpAttribution(link: "https://yelp.com")
                            }//HStack
                            .padding(.trailing, -20)
                        }//Zstack
                      
                        
                    }
                    .padding([.horizontal, .top])//Vstack
                    .navigationBarHidden(true)
                } else {
                    ZStack (alignment: .top){
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                BusinessDetails(business: business)
                        }
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            HStack{
                                Image(systemName: "location")
                                Text(model.placemark?.subLocality ?? "")
                                Spacer()
                                Button("Switch to list view") {
                                    self.isMapShowing = false
                                }
                            }//HStack
                            .padding()
                        }
                        .padding()
                    }//Zstack
                    .navigationBarHidden(true)
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
