//
//  ViewController.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    private let networkService: ClientNetworkServiceProtocol = ClientNetworkService()
    private lazy var locationService: LocationManagerProtocol = {
        let locationManager = LocationManager()
        locationManager.delegate = self
        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationService.requestLocation()
    }

    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeatherDTO?) -> Void) {
        networkService.getCurrentWeather(latitude: latitude, longitude: longitude) { response, error in
            if error != nil {
                //alert > show
                completion(nil)
            } else {
                completion(response)
            }
        }
    }

    func updateLabels(latitude: Double, longitude: Double) {
        getCurrentWeather(latitude: latitude,
                          longitude: longitude) { [weak self] response in
            guard let self = self else { return }
            guard let weather = response else { return }

            DispatchQueue.main.async {
                self.nameLabel.text = weather.name
                self.temperatureLabel.text = String(Int(weather.main.temperature.kelvinToCelcius())) + "°"
                self.dateLabel.text = weather.date.convertToString()
            }
        }
    }
}

extension ViewController: LocationManagerDelegate {
    func didUpdateLocations(latitude: Double, longitude: Double) {
        updateLabels(latitude: latitude, longitude: longitude)
    }
}
