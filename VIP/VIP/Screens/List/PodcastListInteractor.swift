//
//  PodcastListInteractor.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

class PodcastListInteractor: PodcastListInteractorProtocol, PodcastListDataStoreProtocol {
    var presenter: PodcastListPresenterProtocol?

    var podcasts: [Podcast] = []
    let networkWorker: ClientNetworkServiceProtocol

    init(networkWorker: ClientNetworkServiceProtocol) {
        self.networkWorker = networkWorker
    }

    func viewDidLoad() {
        getPodcasts()
    }

    func getPodcasts() {
        networkWorker.podcasts { [weak self] response, error in
            guard let self = self else { return }
            guard let response = response else { return }
            let podcasts = response.feed.podcasts
            self.podcasts = podcasts
            self.presenter?.handeOutput(.showPodcastList(podcasts))
        }
    }
}
