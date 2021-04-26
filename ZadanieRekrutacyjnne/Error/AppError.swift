//
//  AppError.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation

enum AppError: Error {
    case network(description: String)
    case parse(description: String)
    case noData
}
