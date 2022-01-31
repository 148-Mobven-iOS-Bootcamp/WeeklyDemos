//
//  PodcastDetailPresenter.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

class PodcastDetailPresenter: PodcastDetailPresenterProtocol {
    weak var viewController: PodcastDetailViewProtocol?

    func handeOutput(_ output: PodcastDetailInteractorOutput) {
        switch output {
        case .showPodcast(let podcast):
            viewController?.handleOutput(.showPodcast(PodcastDetailPresentation(podcast: podcast)))
        }
    }
}
