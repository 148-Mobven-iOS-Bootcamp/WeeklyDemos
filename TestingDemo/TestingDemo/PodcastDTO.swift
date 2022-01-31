//
//  PodcastDTO.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

// MARK: - PodcastsDTO
struct PodcastsDTO: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let podcasts: [Podcast]

    enum CodingKeys: String, CodingKey {
        case title
        case podcasts = "results"
    }
}

// MARK: - Result
struct Podcast: Codable {
    let artistName, id, name: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
}

// MARK: - Genre
struct Genre: Codable {
    let name: String
    let genreID: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case genreID = "genreId"
        case url
    }
}

