//
//  ViewController.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import UIKit

class PodcastListViewController: UIViewController {

    @IBOutlet var podcastListView: PodcastListView! {
        didSet {
            podcastListView.delegate = self
        }
    }

    var service: ClientNetworkServiceProtocol!

    private var podcasts: [Podcast] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        getPodcasts()
    }

    func getPodcasts() {
        service.podcasts { [weak self] response, error in
            guard let self = self else { return }
            guard let response = response else { return }
            let podcasts = response.feed.podcasts
            self.podcasts = podcasts
            self.podcastListView.showPodcasts(podcasts.map(PodcastListPresentation.init))
        }
    }
}

extension PodcastListViewController: PodcastListViewDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        let podcast = podcasts[indexPath.row]
//        let viewController = PodcastDetailBuilder.build(with: podcast)
//        self.show(viewController, sender: self)
        print(podcast.name)
        print(podcast.artistName)
        print(podcast.artworkUrl100)
        print(podcast.url)
    }
}

