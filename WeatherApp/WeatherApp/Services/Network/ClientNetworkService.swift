//
//  ClientNetworkService.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 22.01.2022.
//

import Foundation

protocol ClientNetworkServiceProtocol {
    func getCurrentWeather(latitude: Double,
                           longitude: Double,
                           completion: @escaping (CurrentWeatherDTO?, NetworkError?) -> Void)
}

class ClientNetworkService: ClientNetworkServiceProtocol {
    private enum Endpoints: String {
        case currentWeather = "weather?lat=%f&lon=%f"

        func urlString(latitude: Double, longitude: Double) -> String {
            return String(format: self.rawValue, latitude, longitude)
        }
    }

    private let networkService: NetworkServiceProtocol = NetworkService()

    func getCurrentWeather(latitude: Double,
                           longitude: Double,
                           completion: @escaping (CurrentWeatherDTO?, NetworkError?) -> Void) {
        let urlString = Endpoints.currentWeather.urlString(latitude: latitude, longitude: longitude)
        networkService.get(from: urlString, completion: completion)
    }
}
