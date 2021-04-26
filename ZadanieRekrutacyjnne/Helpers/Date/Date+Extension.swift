//
//  Date+Extension.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import Foundation

extension Date {
    
    func string(format: WeatherDateFormat = .shortTime) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.string(from: self)
    }
}

extension Optional where Wrapped == Date {
    
    func string(format: WeatherDateFormat = .shortTime) -> String? {
        guard let date = self else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.string(from: date)
    }
}
