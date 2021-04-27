//
//  WeatherForecastView.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import SwiftUI

struct WeatherDetailsView: View {
    @StateObject var viewModel = WeatherDetailsViewModel()
    
    var body: some View {
        NavigationView {
            content
                .navigationBarItems(trailing: NavigationLink(
                    destination: CitySelectionView(
                        viewModel: CitySelectionViewModel(
                            city: $viewModel.city))) {
                    Image(systemName: "slider.horizontal.3")
                })
        }.accentColor(viewModel.isDay ? .black : .gray)
        .fullScreenCover(isPresented: $viewModel.isForecastPresented) {
            NavigationView {
                WeatherForecastView(city: viewModel.city)
                    .navigationTitle("Prognoza")
                    .navigationBarItems(leading:
                                            Button("Wróć") {
                                                viewModel.isForecastPresented = false
                                            }.foregroundColor(.blue))
                    
                    .background(Image("weatherForecast")
                                    .resizable()
                                    .edgesIgnoringSafeArea(.all))
            }
        }
    }
    
    var content: some View {
        
        VStack {
            if viewModel.error == .some(.wrongCity) {
                wrongCityView
            } else {
                mainView
            }
        }
        .foregroundColor(.white)
        .background(Image(viewModel.backgroundImage)
                        .resizable()
                        .edgesIgnoringSafeArea(.all))
        
    }
    
    var mainView: some View {
        Group {
            basicInfo
            Spacer()
                .frame(height: 20)
            detailsRow
            Spacer()
            forecastButton
            Spacer().frame(height: 30)
        }
    }
    
    var basicInfo: some View {
        Group {
            Text(viewModel.cityName)
                .font(.title)
                .fontWeight(.bold)
            Text(viewModel.weatherDescription)
                .font(.body)
            Text(viewModel.temperature)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
    
    var wrongCityView: some View {
        VStack {
            HStack{
                Spacer()
                Text("Nie ma takiego miasta").font(.largeTitle)
                Spacer()
            }
            Spacer()
        }
    }
    
    var forecastButton: some View {
        Button(action: {
            viewModel.isForecastPresented = true
        }, label: {
            VStack {
                Divider().foregroundColor(.white)
                Text("Prognoza")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                Divider().foregroundColor(.white)
            }.background(Color.white.opacity(0.5))
        })
    }
    
    var detailsRow: some View {
        Group {
            HStack() {
                VStack(alignment: .leading)
                {
                    Text("WSCHÓD SŁOŃCA")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(viewModel.sunrise)
                        .font(.headline)
                }.padding(.leading, 20.0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("ZACHÓD SŁOŃCA")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(viewModel.sunset)
                        .font(.headline)
                }.padding(.trailing, 20.0)
            }
            Divider().background(Color.white)
            HStack() {
                VStack(alignment: .leading)
                {
                    Text("WIATR")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(viewModel.wind)
                        .font(.headline)
                }.padding(.leading, 20.0)
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text("ODCZUWALNA")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(viewModel.feelingTemp)
                        .font(.headline)
                }.padding(.trailing, 20.0)
            }
            Divider().background(Color.white)
            HStack() {
                VStack(alignment: .leading)
                {
                    Text("WILGOTNOŚĆ")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(viewModel.humidity)
                        .font(.headline)
                }.padding(.leading, 20.0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("CIŚNIENIE")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text(viewModel.pressure)
                        .font(.headline)
                }.padding(.trailing, 20.0)
            }
            Divider().background(Color.white)
        }
    }
}
