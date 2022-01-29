//
//  PodcastListPresentation.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation

struct PodcastListPresentation {
    let title: String

    init(title: String) {
        self.title = title
    }

    init(podcast: Podcast) {
        self.init(title: podcast.name)
    }
}
