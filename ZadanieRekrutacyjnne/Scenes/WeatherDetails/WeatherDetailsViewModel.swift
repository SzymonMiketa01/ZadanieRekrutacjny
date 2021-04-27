//
//  File.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation
import Combine
import SwiftUI

class WeatherDetailsViewModel: ObservableObject {
    
    @Published var error: AppError? = nil
    @Published var city: String = ""
    @Published var data: WeatherResponse? = nil
    @Published var isForecastPresented: Bool = false
    
    private let weatherRepository: WeatherRemoteRepositoryProtocol = WeatherRemoteRepository()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        city = UserDefaultsHelper.getString(for: .city) ?? "Warsaw"
        
        $city
            .sink(receiveValue:  { [weak self] in
                UserDefaultsHelper.save(object: $0, for: .city)
                self?.fetchWeather(request: WeatherRequest(city: $0))
            })
            .store(in: &disposables)
    }
    
    var cityName: String {
        return data?.name ?? ""
    }
    
    var temperature: String {
        guard let temp = data?.main.temp else { return "" }
        return String(format: "%.1f", temp) + "°"
    }
    
    var weatherDescription: String {
        return data?.weather.first?.weatherDescription.capitalized ?? ""
    }
    
    var sunrise: String {
        return data?.sys.sunrise.string() ?? "-"
    }
    
    var sunset: String {
        return data?.sys.sunset.string() ?? "-"
    }
    
    var wind: String {
        guard let speed = data?.wind.speed else { return "-" }
        return "\(speed) km/h"
    }
    
    var feelingTemp: String {
        guard let feelsLike = data?.main.feelsLike else { return "-" }
        return String(format: "%.1f", feelsLike) + "°"
    }
    
    var humidity: String {
        guard let humidity = data?.main.humidity else { return "-" }
        return String(humidity) + "%"
    }
    
    var pressure: String {
        guard let pressure = data?.main.pressure else { return "-" }
        return String(pressure) + " hPA"
    }
    
    var isDay: Bool {
        guard let data = data else { return true }
        let now = Date()
        if now < data.sys.sunset && now > data.sys.sunrise {
            return true
        } else {
            return false
        }
    }
    
    var backgroundImage: String {
        if isDay {
            return "weatherDay"
        } else {
            return "weatherNight"
        }
    }
    
    private func fetchWeather(request: WeatherRequest) {
        weatherRepository.fetchWeather(request: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    self.error = error
                  self.data = nil
                case .finished:
                  break
                }
            }, receiveValue: { [weak self] weather in
                guard let self = self else { return }

                self.error = nil
                self.data = weather
            })
            .store(in: &disposables)
        
    }
}
