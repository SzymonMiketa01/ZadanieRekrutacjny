//
//  ForecastRow.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import SwiftUI

struct ForecastRow: View {
    
    var data: [WeatherForecastResponse.Item]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
        HStack {
            ForEach(data, id: \.self, content: { element in
                VStack {
                    Text(element.date.hour).foregroundColor(.white)
                    Spacer().frame(height: 10)
                    element.weather.first?.main.image.renderingMode(.template).foregroundColor(.white).frame(width:20, height: 20)
                    Spacer().frame(height: 10)
                    Text("\(element.main.temperature)").lineLimit(1).foregroundColor(.white)
                }
            })
        }
        }
    }
}
