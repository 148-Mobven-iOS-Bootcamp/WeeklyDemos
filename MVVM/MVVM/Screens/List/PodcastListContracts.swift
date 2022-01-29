//
//  PodcastListContracts.swift
//  MVVM
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

protocol PodcastListViewModelProtocol {
    var delegate: PodcastListViewModelDelegate? { get set }
    func viewDidLoad()
    func didSelectRow(_ indexPath: IndexPath)
}

enum PodcastListViewModelOutput {
    case showPodcastList([PodcastListPresentation])
}

enum PodcastListViewRoute {
    case showPodcastDetail(Podcast)
}

protocol PodcastListViewModelDelegate: NSObject {
    func handleOutput(_ output: PodcastListViewModelOutput)
    func navigate(to route: PodcastListViewRoute)
}
