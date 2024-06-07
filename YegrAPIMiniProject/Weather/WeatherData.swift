//
//  WeatherData.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/7/24.
//

import UIKit

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Main: Decodable {
    let temp: Double // 현재 온도
    let feels_like:Double // 체감 온도
    let temp_min: Double // 최저
    let temp_max: Double // 최고
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double // 풍속
    let deg: Int // 풍향
}
