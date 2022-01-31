//
//  PodcastListBuilder.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

class PodcastListBuilder {
    static func build() -> PodcastListViewController {
        let viewController = PodcastListViewController(nibName: "PodcastListViewController", bundle: nil)
        let interactor = PodcastListInteractor(networkWorker: appContainer.service)
        let presenter = PodcastListPresenter()
        let router = PodcastListRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
