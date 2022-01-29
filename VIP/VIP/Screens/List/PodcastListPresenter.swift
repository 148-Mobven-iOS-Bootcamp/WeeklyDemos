//
//  PodcastListPresenter.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

class PodcastListPresenter: PodcastListPresenterProtocol {
    weak var viewController: PodcastListViewProtocol?

    func handeOutput(_ output: PodcastListInteractorOutput) {
        switch output {
        case .showPodcastList(let podcasts):
            viewController?.handleOutput(.showPodcastList(podcasts.map(PodcastListPresentation.init)))
        }
    }
}
