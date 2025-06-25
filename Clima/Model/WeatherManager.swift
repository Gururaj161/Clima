//
//  WeatherManager.swift
//  Clima
//
//  Created by Gururaja M on 25/06/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

protocol WeatherDataDelegate: AnyObject {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let apiKey = "https://api.openweathermap.org/data/2.5/weather?appid=9bc5aa15ed2ff82bbf6aa05b8cfed704&units=metric"
    
    var delegate: WeatherDataDelegate?
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(apiKey)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let urlString = "\(apiKey)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){data,response,error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
                
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(cityName: decodedData.name, temparature: decodedData.main.temp, conditionID: decodedData.weather[0].id)
            return weather
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
