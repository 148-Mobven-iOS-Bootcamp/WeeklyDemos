//
//  AppRouter.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation
import UIKit

class AppRouter {
    func start(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let podcastListVC = PodcastListBuilder.build()
        let navigationContoller = UINavigationController(rootViewController: podcastListVC)
        window.rootViewController = navigationContoller
        window.makeKeyAndVisible()
        window.windowScene = scene
        return window
    }
}
