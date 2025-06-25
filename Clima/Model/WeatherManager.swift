//
//  WeatherManager.swift
//  Clima
//
//  Created by Gururaja M on 25/06/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    let apiKey = "https://api.openweathermap.org/data/2.5/weather?appid=9bc5aa15ed2ff82bbf6aa05b8cfed704&units=metric"
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(apiKey)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){data,response,error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
                    self.parseJSON(weatherData:safeData)
                }
                
            }
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) {
        
    }
}
