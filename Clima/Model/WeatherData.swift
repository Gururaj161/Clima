//
//  WeatherData.swift
//  Clima
//
//  Created by Gururaja M on 25/06/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct WeatherData: Decodable {
    var weather: [Weather]
    var main: Main
    var name:String
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id:Int
}
