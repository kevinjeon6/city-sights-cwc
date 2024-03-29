//
//  ContentView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/8/22.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        //Detect the authorization status of geolocating the user

        if model.authorizationState == .notDetermined {
            OnboardingView()
        } else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse{
            //show home view
            HomeView()
        } else {
      LocationDeniedView()
        }
        //if undetermined, show onboarding
        
        //if approved, show home view
        
        //if denied show denied
     
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            
    }
}
