//
//  PodcastDetailBuilder.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

class PodcastDetailBuilder {
    static func build() -> PodcastDetailViewController {
//    static func build(with podcast: Podcast) -> PodcastDetailViewController {
        let viewController = PodcastDetailViewController(nibName: "PodcastDetailViewController", bundle: nil)
        let interactor = PodcastDetailInteractor()
        let presenter = PodcastDetailPresenter()
        let router = PodcastDetailRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
//        interactor.podcast = podcast
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
