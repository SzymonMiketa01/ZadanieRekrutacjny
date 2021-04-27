//
//  Date+Extension.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 26/04/2021.
//

import Foundation

extension Date {
    
    static func sortDayAndMonth(dateComponent: DateComponents, dateComponent2: DateComponents) -> Bool {
        guard let firstMonth = dateComponent.month, let secondMonth = dateComponent2.month, let firstDay = dateComponent.day, let secondDay = dateComponent2.day else { return false }
        
        if firstMonth != secondMonth {
            return firstMonth < secondMonth
        }
        
        return firstDay < secondDay
    }
    
    func string(format: WeatherDateFormat = .shortTime) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.string(from: self)
    }
    
    var day: Int? {
        Calendar.current.dateComponents([Calendar.Component.day], from: self).day
    }
    
    var monthAndDayComponent: DateComponents {
        Calendar.current.dateComponents([Calendar.Component.day, Calendar.Component.month], from: self)
    }
    
    var hour: String {
        guard let hour = Calendar.current.dateComponents([Calendar.Component.hour], from: self).hour else { return "-" }
        
        return "\(hour)"
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
