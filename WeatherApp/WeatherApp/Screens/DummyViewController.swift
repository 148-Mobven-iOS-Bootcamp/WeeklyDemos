//
//  DummyViewController.swift
//  WeatherApp
//
//  Created by Semih Emre ÜNLÜ on 23.01.2022.
//

import UIKit

class DummyViewController: UIViewController {

    private var networkService: ClientNetworkServiceProtocol = ClientNetworkService()

    var hourlyWeather: HourlyWeatherDTO!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        getWeather()
    }

    deinit {
        print(DummyViewController.nibName)
    }

    func getWeather() {
        networkService.getHourlyWeather(latitude: 49.2, longitude: 29.0) { response, error in
//            guard let self = self else { return }
            self.hourlyWeather = response
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
