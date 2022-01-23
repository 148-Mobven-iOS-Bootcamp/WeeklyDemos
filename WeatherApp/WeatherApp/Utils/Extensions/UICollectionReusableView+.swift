//
//  UICollectionReusableView+.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 23.01.2022.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
}
