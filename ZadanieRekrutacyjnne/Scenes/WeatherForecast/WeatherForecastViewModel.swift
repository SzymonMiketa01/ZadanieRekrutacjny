//
//  WeatherForecastViewModel.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import Foundation
import Combine
import SwiftUI

class WeatherForecastViewModel: ObservableObject {
    
    @Published var data: WeatherForecastResponse? = nil
    @Published var groupedData: [DateComponents: [WeatherForecastResponse.Item]] = [:]
    var city: String
    
    private let weatherRepository: WeatherRemoteRepositoryProtocol = WeatherRemoteRepository()
    private var disposables = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
        
        fetchWeatherForecast(request: WeatherRequest(city: city))
        
        $data.sink(receiveValue: { [weak self] in
            self?.prepareData(data: $0)
        })
        .store(in: &disposables)
    }
    
    private func prepareData(data: WeatherForecastResponse?) {
        guard let data = data else { return }
        
        groupedData = Dictionary(grouping: data.list, by: {
            $0.date.monthAndDayComponent
        })
  
    }
    
    private func fetchWeatherForecast(request: WeatherRequest) {
        weatherRepository.fetchForecast(request: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                  self.data = nil
                case .finished:
                  break
                }
            }, receiveValue: { [weak self] weather in
                guard let self = self else { return }

                self.data = weather
            })
            .store(in: &disposables)
        
    }
}
