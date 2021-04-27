//
//  AppError.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation

enum AppError: Error, Equatable {
    case network(description: String)
    case parse(description: String)
    case noData
    case wrongCity
    case responseError(message: String)
    case unknown
}

enum ErrorMessage: String {
    case noCity = "city not found"
}
