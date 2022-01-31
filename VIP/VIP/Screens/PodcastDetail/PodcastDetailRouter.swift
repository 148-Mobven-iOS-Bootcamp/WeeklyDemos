//
//  PodcastDetailRouter.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

class PodcastDetailRouter: PodcastDetailRouterProtocol {
    weak var viewController: PodcastDetailViewController?
    var dataStore: PodcastDetailDataStoreProtocol?

    func navigate(to route: PodcastDetailRoute) {
        switch route {
        case .showPodcastList:
            viewController?.navigationController?.popViewController(animated: false)
        }
    }
}
