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
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                                                NavigationLink(
                                                    destination: CitySelectionView(
                                                        viewModel: CitySelectionViewModel(
                                                            city: $viewModel.city))) {
                                                    Image(systemName: "slider.horizontal.3")
                                                }

//                        NavigationLink(
//                            destination: CitySelectionView(
//                                viewModel: CitySelectionViewModel(
//                                    isPresented: $viewModel.showingSheet,
//                                    city: $viewModel.city))) {
//                            Image(systemName: "slider.horizontal.3")
//                        }
                    }
                }
                //.sheet(isPresented: $viewModel.showingSheet, content: {
//                    CitySelectionView(
//                        viewModel: CitySelectionViewModel(
//                            isPresented: $viewModel.showingSheet,
//                            city: $viewModel.city))
//                })
        }.accentColor(viewModel.isDay ? .black : .white)
        
        
    }
    
    var content: some View {
        VStack {
            Text(viewModel.cityName)
                .font(.title)
                .fontWeight(.bold)
            Text(viewModel.weatherDescription)
                .font(.body)
            Text(viewModel.temperature)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 20)
            detailsRow
        }
        .foregroundColor(.white)
        .background(Image(viewModel.backgroundImage)
                        .resizable()
                        .edgesIgnoringSafeArea(.all))
    }
    
    var detailsRow: some View {
        Group {
            HStack() {
                VStack(alignment: .leading)
                {
                    Text("WSCHÓD SŁOŃCA")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(viewModel.sunrise)
                        .font(.headline)
                }.padding(.leading, 20.0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("ZACHÓD SŁOŃCA")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(viewModel.sunset)
                        .font(.headline)
                }.padding(.trailing, 20.0)
            }
            Divider().background(Color.white)
            HStack() {
                VStack(alignment: .leading)
                {
                    Text("WIATR")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(viewModel.wind)
                        .font(.headline)
                }.padding(.leading, 20.0)
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text("ODCZUWALNA")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text(viewModel.feelingTemp)
                        .font(.headline)
                }.padding(.trailing, 20.0)
            }
            Divider().background(Color.white)
            HStack() {
                VStack(alignment: .leading)
                {
                    Text("WILGOTNOŚĆ")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Text(viewModel.humidity)
                        .font(.headline)
                }.padding(.leading, 20.0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("CIŚNIENIE")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Text(viewModel.pressure)
                        .font(.headline)
                }.padding(.trailing, 20.0)
            }
            Divider().background(Color.white)
            Spacer()
        }
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(viewModel: WeatherDetailsViewModel())
    }
}
