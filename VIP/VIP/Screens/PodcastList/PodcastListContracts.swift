//
//  PodcastListContracts.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

enum PodcastListPresenterOutput {
    case showPodcastList([PodcastListPresentation])
}

protocol PodcastListViewProtocol: NSObject {
    func handleOutput(_ output: PodcastListPresenterOutput)
}

protocol PodcastListInteractorProtocol {
    func viewDidLoad()
}

enum PodcastListRoute {
    case showPodcastDetail(index: Int)
}

typealias PodcastListRouterProtocol = PodcastListRoutingProtocol & PodcastListDataPassingProtocol

protocol PodcastListDataStoreProtocol {
    var podcasts: [Podcast] { get set }
}

protocol PodcastListDataPassingProtocol {
    var dataStore: PodcastListDataStoreProtocol? { get }
}

protocol PodcastListRoutingProtocol {
    func navigate(to route: PodcastListRoute)
}

enum PodcastListInteractorOutput {
    case showPodcastList([Podcast])
}

protocol PodcastListPresenterProtocol {
    func handeOutput(_ output: PodcastListInteractorOutput)
}
