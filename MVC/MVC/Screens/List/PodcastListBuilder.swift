//
//  PodcastListBuilder.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import Foundation
import UIKit

class PodcastListBuilder {
    static func build() -> PodcastListViewController {
        let storyboard = UIStoryboard(name: "PodcastList", bundle: nil)
        let viewControler = storyboard.instantiateViewController(withIdentifier: "PodcastList") as! PodcastListViewController
        viewControler.service = appContainer.service
        return viewControler
    }
}
