//
//  BaseRemoteRepository.swift
//  ZadanieRekrutacyjnne
//
//  Created by Szymon Miketa on 25/04/2021.
//

import Foundation
import Combine

protocol RemoteRepositoryProtocol {
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, AppError>
    func createDataTask<T>(with urlRequest: URLRequest) -> AnyPublisher<T, AppError> where T: Decodable
    var urlSession: URLSession { get set }
}

class BaseRemoteRepository: RemoteRepositoryProtocol {
    
    var urlSession: URLSession = .shared
    
    func createDataTask<T>(with urlRequest: URLRequest) -> AnyPublisher<T, AppError> where T: Decodable {
        urlSession.dataTaskPublisher(for: urlRequest)
           .mapError { error in
               return AppError.network(description: error.localizedDescription)
           }
           .flatMap(maxPublishers: .max(1), { [unowned self] element in
            return self.decode(element.data)
           })
            .eraseToAnyPublisher()
    }
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, AppError> {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .secondsSince1970
        
      return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
          .parse(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }
}
