//
//  WeatherData.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit

struct WeatherInfo {
    let message: String
    let cod: String
    let count: Int
    let list: [list]
}

struct list {
    let id: Int
    let name: String
    let coord: Coord
    let main: Main
    let dt: Int
    let wind: Wind
    let sys: Sys
    let rain: String?
    let snow: String?
    let clouds: Clouds
    let weather: [Weather]
}

struct Coord {
    let lat: Double
    let lon: Double
}

struct Main {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct Wind {
    let speed: Double
    let deg: Int
}

struct Sys {
    let country: String
}

struct Clouds {
    let all: Int
}

struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
