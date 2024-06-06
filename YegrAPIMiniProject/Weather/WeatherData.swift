//
//  WeatherData.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit

struct WeatherInfo {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coord {
    let lon: Double
    let lat: Double
}

struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main {
    let temp: Double
    let feels_like:Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct Wind {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct Rain: Codable {
    let perHour: Double
    
    enum CodingKeys: String, CodingKey {
        case perHour = "1h"
    }
}

struct Clouds {
    let all: Int
}

struct Sys {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
