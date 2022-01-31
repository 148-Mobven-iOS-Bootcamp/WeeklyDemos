//
//  PodcastListRouter.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

class PodcastListRouter: PodcastListRouterProtocol {
    weak var viewController: PodcastListViewController?
    var dataStore: PodcastListDataStoreProtocol?

    func navigate(to route: PodcastListRoute) {
        switch route {
        case .showPodcastDetail(let index):
            if let podcasts = dataStore?.podcasts {
                let podcast = podcasts[index]

                //let destinationVC = PodcastDetailBuilder.build(with: podcast)
                let destinationVC = PodcastDetailBuilder.build()
                var destinationDataStore = destinationVC.router?.dataStore

                destinationDataStore?.podcast = podcast
                viewController?.show(destinationVC, sender: nil)
            }
        }
    }
}
