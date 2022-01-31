//
//  Double+.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

extension Double {
    func kelvinToCelcius() -> Double {
        let kelvinInZero = 273.0
        return self - kelvinInZero
    }
}
