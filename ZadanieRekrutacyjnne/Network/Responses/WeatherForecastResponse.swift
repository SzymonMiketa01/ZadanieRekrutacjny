//
//  WeatherForecastResponse.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import Foundation
import SwiftUI

struct WeatherForecastResponse: Codable {
    let list: [Item]
    
    struct Item: Codable, Hashable {
        let date: Date
        let main: Main
        let weather: [Weather]
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
        }
    }
    
    struct Main: Codable, Hashable {
        let temp: Double
        let feelsLike: Double
        
        var temperature: String {
            return String(format: "%.1f", temp) + "°"
        }
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
        }
    }
    
    struct Weather: Codable, Hashable {
        let main: MainEnum
        let weatherDescription: String
        
        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            
            weatherDescription = try values.decode(String.self, forKey: .weatherDescription)
            let weather = try values.decode(String.self, forKey: .main)
            main = MainEnum(rawValue: weather) ?? .unknwon
        }
    }
    
    enum MainEnum: String, Codable {
        case clear = "Clear"
        case clouds = "Clouds"
        case rain = "Rain"
        case snow = "Snow"
        case unknwon
        
        var image: Image {
            switch self {
            case .clear:
                return Image(systemName: "sun.max.fill")
            case .clouds:
                return Image(systemName: "cloud.fill")
            case .rain:
                return Image(systemName: "cloud.rain.fill")
            case .snow:
                return Image(systemName: "cloud.snow.fill")
            default:
                return Image(systemName: "sun.max.fill")
            }
        }
    }
}
