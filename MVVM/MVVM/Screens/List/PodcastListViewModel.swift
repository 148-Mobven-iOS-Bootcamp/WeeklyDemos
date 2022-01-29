//
//  PodcastListViewModel.swift
//  MVVM
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

class PodcastListViewModel: PodcastListViewModelProtocol {
    weak var delegate: PodcastListViewModelDelegate?

    private var podcasts: [Podcast] = []
    let service: ClientNetworkServiceProtocol

    init(service: ClientNetworkServiceProtocol) {
        self.service = service
    }

    func viewDidLoad() {
        getPodcasts()
    }

    func getPodcasts() {
        service.podcasts { [weak self] response, error in
            guard let self = self else { return }
            guard let response = response else { return }
            let podcasts = response.feed.podcasts
            self.podcasts = podcasts
            self.delegate?.handleOutput(.showPodcastList(podcasts.map(PodcastListPresentation.init)))
        }
    }

    func didSelectRow(_ indexPath: IndexPath) {
        self.delegate?.navigate(to: .showPodcastDetail(podcasts[indexPath.row]))
    }
}

