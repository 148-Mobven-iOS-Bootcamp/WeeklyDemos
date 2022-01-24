//
//  MainWeatherViewController.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 22.01.2022.
//

import UIKit

class MainWeatherViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourlyWeatherContainerView: UIView!

    private let networkService: ClientNetworkServiceProtocol = ClientNetworkService()
    private lazy var locationService: LocationManagerProtocol = {
        let locationManager = LocationManager()
        locationManager.delegate = self
        return locationManager
    }()

    private var isHourlyWeatherAdded = false
    private var hourlyWeatherViewControler: HourlyWeatherViewContoller!

    override func viewDidLoad() {
        super.viewDidLoad()

        locationService.requestLocation()
    }

    func addHourlyWeatherView(latitude: Double?,
                              longitude: Double?) {
        hourlyWeatherViewControler = HourlyWeatherViewContoller(nibName: HourlyWeatherViewContoller.nibName,
                                                                bundle: nil)
        hourlyWeatherViewControler.configure(networkService: networkService, latitude: latitude, longitude: longitude)
        hourlyWeatherViewControler.view.frame = hourlyWeatherContainerView.bounds
        hourlyWeatherContainerView.clipsToBounds = true
        hourlyWeatherContainerView.addSubview(hourlyWeatherViewControler.view)
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

extension MainWeatherViewController: LocationManagerDelegate {
    func didUpdateLocations(latitude: Double, longitude: Double) {
        if !isHourlyWeatherAdded {
            addHourlyWeatherView(latitude: latitude, longitude: longitude)
            isHourlyWeatherAdded.toggle()
        }

        updateLabels(latitude: latitude, longitude: longitude)
    }
}
