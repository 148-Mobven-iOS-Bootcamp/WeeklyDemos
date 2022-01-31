//
//  PodcastDetailViewController.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import UIKit
import Kingfisher

class PodcastDetailViewController: UIViewController, PodcastDetailViewProtocol {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var podcastNameLabel: UILabel!

    var interactor: PodcastDetailInteractorProtocol?
    var router: PodcastDetailRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
    }

    func handleOutput(_ output: PodcastDetailPresenterOutput) {
        switch output {
        case .showPodcast(let podcast):
            artistNameLabel.text = podcast.artistName
            podcastNameLabel.text = podcast.title
            imageView.kf.setImage(with: podcast.imageURL)
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        router?.navigate(to: .showPodcastList)
    }
}
