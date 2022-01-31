//
//  PasswordValidator.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

class PasswordValidator {
    let passwordCountLowerBound = 8
    let passwordCountUpperBound = 12

    func validate(_ password: String) -> Bool {
        return password.count >= passwordCountLowerBound && password.count <= passwordCountUpperBound
    }
}
