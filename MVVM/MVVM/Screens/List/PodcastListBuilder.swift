//
//  PodcastListBuilder.swift
//  MVVM
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

class PodcastListBuilder {
    static func build() -> PodcastListViewController {
        let viewController = PodcastListViewController(nibName: "PodcastListViewController", bundle: nil)
        viewController.viewModel = PodcastListViewModel(service: appContainer.service)
        return viewController
    }
}
