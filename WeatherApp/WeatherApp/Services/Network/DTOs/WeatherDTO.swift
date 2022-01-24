//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 23.01.2022.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let icon: String

    var iconURL: URL? {
        let urlString = "http://openweathermap.org/img/wn/\(icon).png"
        return URL(string: urlString)
    }
}
