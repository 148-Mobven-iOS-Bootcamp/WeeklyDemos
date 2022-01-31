//
//  PodcastDetailInteractor.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

class PodcastDetailInteractor: PodcastDetailInteractorProtocol, PodcastDetailDataStoreProtocol {
    var presenter: PodcastDetailPresenterProtocol?

    var podcast: Podcast?

    func viewDidLoad() {
        guard let podcast = podcast else { return }
        self.presenter?.handeOutput(.showPodcast(podcast))
    }
}
