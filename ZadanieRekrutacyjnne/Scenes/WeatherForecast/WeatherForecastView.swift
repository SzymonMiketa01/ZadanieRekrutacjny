//
//  WeatherForecastView.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import SwiftUI

struct WeatherForecastView: View {
    @ObservedObject var viewModel: WeatherForecastViewModel
    
    init(city: String) {
        self.viewModel = WeatherForecastViewModel(city: city)
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
    }
    
    var body: some View {
        List {
            ForEach(viewModel.groupedData.keys.sorted(by: Date.sortDayAndMonth(dateComponent:dateComponent2:)), id: \.self) { key in
                Section(header: Header(data: viewModel.groupedData[key]?.first), content: {
                    ForecastRow(data: viewModel.groupedData[key] ?? []).listRowBackground(Color.clear)
                }).background(Color.clear).listRowBackground(Color.clear)
                
            }
        }
    }
}

struct Header: View {
    var data: WeatherForecastResponse.Item?
    
    var body: some View {
        Text((data?.date.string(format: .date) ?? "-")).foregroundColor(.black).font(.caption)
    }
}

