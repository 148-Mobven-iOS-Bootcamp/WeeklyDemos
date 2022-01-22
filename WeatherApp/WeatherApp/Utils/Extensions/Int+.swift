//
//  Int+.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 22.01.2022.
//

import Foundation

extension Int {
    func convertToString() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
    }
}
