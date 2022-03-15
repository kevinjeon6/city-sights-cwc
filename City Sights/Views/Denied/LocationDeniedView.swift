//
//  LocationDeniedView.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/14/22.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Text("Whoops!")
                .font(.title)
            Text("We need to access your location to provide you with the best sights in the city. You can change your decision at any time in Settings.")
            
            Spacer()
            Button {
                //open settings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }//ZStack
                
            }//Button
            .padding()
            Spacer()
            
            
        }//Vstack
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
    
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
