//
//  MyClass.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

class MyClass {
    var stringVariable: String!

    func isNumeric() -> Bool {
        let integerValue = Int(stringVariable)
        return integerValue != nil
    }
}
