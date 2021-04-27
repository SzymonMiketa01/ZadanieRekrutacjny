//
//  WeatherRemoteRepository.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation
import Combine

protocol WeatherRemoteRepositoryProtocol {
    func fetchWeather(request: WeatherRequest) -> AnyPublisher<WeatherResponse, AppError>
    func fetchForecast(request: WeatherRequest) -> AnyPublisher<WeatherForecastResponse, AppError>
}

class WeatherRemoteRepository: BaseRemoteRepository, WeatherRemoteRepositoryProtocol {
    
    enum WeatherType: String {
        case current = "weather"
        case forecast = "forecast"
    }
    
    struct OpenWeatherComponents {
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5/"
        static let key = "e6a403d16986388864a4c5659fad3bea"
    }
    
    private func getUrlComponents(for weatherType: WeatherType) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = OpenWeatherComponents.scheme
        urlComponents.host = OpenWeatherComponents.host
        urlComponents.path = OpenWeatherComponents.path + weatherType.rawValue
        
        
        return urlComponents
    }
    
    func fetchWeather(request: WeatherRequest) -> AnyPublisher<WeatherResponse, AppError> {
        var components = getUrlComponents(for: .current)
        components.queryItems = request.getQueryItems()
        
        guard let url = components.url else {
            return Fail(error: AppError.network(description: "Error while creating URL"))
                .eraseToAnyPublisher()
        }
        
        return createDataTask(with: URLRequest(url: url))
    }
    
    func fetchForecast(request: WeatherRequest) -> AnyPublisher<WeatherForecastResponse, AppError> {
        var components = getUrlComponents(for: .forecast)
        components.queryItems = request.getQueryItems()
        
        guard let url = components.url else {
            return Fail(error: AppError.network(description: "Error while creating URL"))
                .eraseToAnyPublisher()
        }
        
        return createDataTask(with: URLRequest(url: url))
    }
}
