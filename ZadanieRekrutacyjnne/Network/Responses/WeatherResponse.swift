//
//  WeatherResponse.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation

struct WeatherResponse: Codable {
    
    let coord: Cord
    let dt: Date
    
    struct Cord: Codable {
        let lat: Double
        let lon: Double
    }
    
    let weather: [Weather]
    
    struct Weather: Codable {
        let weatherDescription: String
        let icon: String
        
        enum CodingKeys: String, CodingKey {
            case weatherDescription = "description"
            case icon
        }
    }
    
    let name: String
    let wind: Wind
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    let main: Main
    
    struct Main: Codable {
        let temp: Double
        let feelsLike: Double
        let pressure: Int
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
        }
    }
    
    let sys: Sys
    
    struct Sys: Codable {
        let sunrise: Date
        let sunset: Date
    }
}
