//
//  OnboardingView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/10/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelction = 0
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)

    
    var body: some View {
        VStack{
            TabView(selection: $tabSelction) {
                VStack(spacing: 20){
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    
                    Text("We'll show you the best restaurants, venues, and more based on your location!")
                        .font(.subheadline)
                }//Vstack
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                
                VStack(spacing: 20){
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    
                    Text("City Sights helps you find the best of the city!")
                       
                        .font(.subheadline)
                }//Vstack
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
                
            }//Tabview
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button {
                if tabSelction == 0 {
                    tabSelction = 1
                } else {
                    //Request for geolocation permission
                    model.requestGeolocationPermission()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelction == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                    
                }//Zstack
            }//Button
            .accentColor(tabSelction == 0 ? blue : turquoise)
            .padding()
            
            Spacer()

            
        }//Vstack
        .background(tabSelction == 0 ? blue : turquoise)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
