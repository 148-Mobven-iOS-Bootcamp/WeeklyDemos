//
//  PodcastDetailPresentation.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import Foundation

struct PodcastDetailPresentation {
    let title: String
    let artistName: String
    let imageURL: URL?

    init(title: String, artistName: String, imageURLString: String) {
        self.title = title
        self.artistName = artistName
        self.imageURL = URL(string: imageURLString)
    }

    init(podcast: Podcast) {
        self.init(title: podcast.name,
                  artistName: podcast.artistName,
                  imageURLString: podcast.artworkUrl100)
    }
}
