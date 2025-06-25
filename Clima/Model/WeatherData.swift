//
//  WeatherData.swift
//  Clima
//
//  Created by Gururaja M on 25/06/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct WeatherData: Codable {
    var weather: [Weather]
    var main: Main
    var name:String
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id:Int
}
