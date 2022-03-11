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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
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
            //update the authorizationState property
            authorizationState = locationManager.authorizationStatus
            
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
            
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
            
            
            
        }
     
        
        //If we have the coordinates of the user, get Yelp API
        
        
        //Stop requesting the location aftewr we get it once
        
    }
    
    
    //MARK: - Yelp API methods
    
    func getBusinesses(category: String, location: CLLocation){
        // Create URL (traditional way?)
//        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
//
//        let url = URL(string: urlString)
        
        //Another way to create URL
        
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: String(6))
        ]
       let url = urlComponents?.url
        
        
        //Create URL Request
        
        
        guard url != nil else {
            return
        }
        
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
        //Get URLSession
        
        
        let session = URLSession.shared
        
        //Create Data Task
        let dataTask = session.dataTask(with: request) { data, response, error in
            //Check that there isn't an error
            
            
            if error == nil {
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(BusinessSearch.self, from: data!)
                    
                    //Sort businesses
                    
                    var businesses = result.businesses
                    businesses.sort { (b1, b2) -> Bool in
                        return b1.distance ?? 0 < b2.distance ?? 0
                    }
                    
                    //Call the get image method of the businesses
                    
                    for b in businesses {
                        b.getImageData()
                    }
                    //Assign results to the appropriate property
                    DispatchQueue.main.async {
                        if category == Constants.sightsKey {
                            self.sights = businesses
                        } else if category == Constants.restaurantsKey {
                            self.restaurants = businesses
                        }
                    }
                    
                } catch {
                    print(error)
                }
                
            }
        }
            //Start the Data Task
            dataTask.resume()
        }
    }
    


