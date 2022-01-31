//
//  ResourceLoader.swift
//  TestingDemoTests
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation
@testable import TestingDemo

class ResourceLoader {
    func loadPodcastDTO(jsonName: String) -> PodcastsDTO? {
        guard let url = Bundle(for: DummyClass.self).url(forResource: jsonName, withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let podcastDTO = try? JSONDecoder().decode(PodcastsDTO.self, from: data) else { return nil }
        return podcastDTO
    }
}

class DummyClass { }
