//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 23.01.2022.
//

import UIKit
import Kingfisher

class HourlyWeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item: Forecast) {
        temperatureLabel.text = String(Int(item.temperature.kelvinToCelcius()))
        weatherIconImageView.kf.setImage(with: item.weather.first?.iconURL)
        hourLabel.text = item.timeInterval.convertToHourString()
    }
}
