//
//  ZadanieRekrutacyjnneApp.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import SwiftUI

@main
struct ZadanieRekrutacyjnneApp: App {
    @State var test: String = "s"
    var body: some Scene {
        WindowGroup {
            WeatherDetailsView()
        }
    }
}
