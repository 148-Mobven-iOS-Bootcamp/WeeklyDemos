//
//  MockClienrNetworkService.swift
//  TestingDemoTests
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation
@testable import TestingDemo

class MockClientNetworkService: ClientNetworkServiceProtocol {
    var podcastDTO: PodcastsDTO?

    init() {
        self.podcastDTO = ResourceLoader().loadPodcastDTO(jsonName: "podcasts")
    }

    func podcasts(completion: @escaping (PodcastsDTO?, NetworkError?) -> Void) {
        completion(podcastDTO, nil)
    }
}
