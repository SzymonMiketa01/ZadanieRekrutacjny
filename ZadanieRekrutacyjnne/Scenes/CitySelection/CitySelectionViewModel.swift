//
//  CitySelectionViewModel.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import Foundation
import SwiftUI

class CitySelectionViewModel: ObservableObject {
    
    @Binding var city: String    
    @Published var temporaryCity: String
    
    init(city: Binding<String>) {
        self._city = city
        self.temporaryCity = city.wrappedValue
    }
}
