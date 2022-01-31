//
//  PodcastDetailContracts.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

enum PodcastDetailPresenterOutput {
    case showPodcast(PodcastDetailPresentation)
}

protocol PodcastDetailViewProtocol: NSObject {
    func handleOutput(_ output: PodcastDetailPresenterOutput)
}

protocol PodcastDetailInteractorProtocol {
    func viewDidLoad()
}

enum PodcastDetailRoute {
    case showPodcastList
}

typealias PodcastDetailRouterProtocol = PodcastDetailRoutingProtocol & PodcastDetailDataPassingProtocol

protocol PodcastDetailDataStoreProtocol {
    var podcast: Podcast? { get set }
}

protocol PodcastDetailDataPassingProtocol {
    var dataStore: PodcastDetailDataStoreProtocol? { get }
}

protocol PodcastDetailRoutingProtocol {
    func navigate(to route: PodcastDetailRoute)
}

enum PodcastDetailInteractorOutput {
    case showPodcast(Podcast)
}

protocol PodcastDetailPresenterProtocol {
    func handeOutput(_ output: PodcastDetailInteractorOutput)
}
