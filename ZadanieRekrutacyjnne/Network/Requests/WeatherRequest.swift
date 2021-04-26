//
//  WeatherRequest.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation

protocol URLQueriable {
    
}

struct WeatherRequest: Encodable, URLQueriable {
    let city: String
    let units = "metric"
    let lang = "pl"
    let appid = WeatherRemoteRepository.OpenWeatherComponents.key
    
    enum CodingKeys: String, CodingKey {
        case city = "q"
        case units
        case lang
        case appid
    }
}

extension Encodable where Self: URLQueriable  {
    func getQueryItems() -> [URLQueryItem] {
        guard let jsonData = try? JSONEncoder().encode(self),
              let dict = (try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)) as? [String: Any] else {
                return []
        }
        
        return dict.compactMap {
            guard let value = $0.value as? String else { return nil }
            return URLQueryItem(name: $0.key, value: value)
        }
    }
}
