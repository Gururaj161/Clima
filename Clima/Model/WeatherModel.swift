//
//  WeatherModel.swift
//  Clima
//
//  Created by Gururaja M on 25/06/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct WeatherModel {
    
    let cityName:String
    let temparature:Double
    let conditionID:Int
    
    var temparatureString:String{
        return String(format: "%.1f", temparature)
    }
    
    var conditionName:String{
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
