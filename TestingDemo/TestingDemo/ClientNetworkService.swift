//
//  ClientNetworkService.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

protocol ClientNetworkServiceProtocol {
    func podcasts(completion: @escaping (PodcastsDTO?, NetworkError?) -> Void)
}

class ClientNetworkService: ClientNetworkServiceProtocol {
    private enum Endpoints: String {
        case podcasts = "podcast-episodes"
    }

    private let networkService: NetworkServiceProtocol = NetworkService()

    func podcasts(completion: @escaping (PodcastsDTO?, NetworkError?) -> Void) {
        let urlString = Endpoints.podcasts.rawValue
        networkService.get(from: urlString, completion: completion)
    }
}
