//
//  PodcastListView.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import UIKit

protocol PodcastListViewDelegate: NSObject {
    func didSelectRowAt(indexPath: IndexPath)
}

class PodcastListView: UIView {
    @IBOutlet weak var tableView: UITableView!

    weak var delegate: PodcastListViewDelegate?

    private var podcasts: [PodcastListPresentation] = []

    func showPodcasts(_ podcasts: [PodcastListPresentation]) {
        self.podcasts = podcasts

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PodcastListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRowAt(indexPath: indexPath)
    }
}

extension PodcastListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = podcasts[indexPath.row].title
        return cell
    }
}
