//
//  Double+.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 22.01.2022.
//

import Foundation

extension Double {
    func kelvinToCelcius() -> Double {
        let kelvinZeroInCelcius: Double = 273
        return self - kelvinZeroInCelcius
    }
}
