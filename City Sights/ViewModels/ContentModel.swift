//
//  ContentModel.swift
//  City Sights
//
//  Created by Kevin Mattocks on 3/8/22.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    
    override init(){
        
        //Init method of NSObject
        super.init()
        //Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        
        //Request permission from user
        locationManager.requestWhenInUseAuthorization()
        
        
    }
        //MARK: - Location Manager Delegate Methods
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            
            if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
                //Start geolocation of the user, after getting permission
                locationManager.startUpdatingLocation()
            } else if locationManager.authorizationStatus == .denied {
                
            }
        }
        
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            locationManager.stopUpdatingLocation()
            
//            getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
            
            
            
        }
     
        
        //If we have the coordinates of the user, get Yelp API
        
        
        //Stop requesting the location aftewr we get it once
        
    }
    
    
    //MARK: - Yelp API methods
    
    func getBusinesses(category: String, location: CLLocation){
        // Create URL (traditional way?)
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        
        let url = URL(string: urlString)
        
        //Another way to create URL
        /*
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: String(6))
        ]
         var url = urlComponents?.url
        */
        
        //Create URL Request
        
        
        guard url != nil else {
            return
        }
        
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.addValue("Bearer 9A6HbuBUdhEeUKKaval0-nc5IhG3-XYH3A09NgELAKntvkdYXTgVLKqVtEsqrigwyuS_6tBszGVwwc41u0Hoq83ElJOdWlGkoWigRwGAsQuQgTeobF1yHebD_s0oYnYx", forHTTPHeaderField: "Authorization")
        //Get URLSession
        
        
        let session = URLSession.shared
        
        //Create Data Task
        let dataTask = session.dataTask(with: request) { Data, response, error in
            //Check that there isn't an error
            
            guard error == nil else {
                return
            }
        }
        //Start the Data Task
        dataTask.resume()
    }
    
}

