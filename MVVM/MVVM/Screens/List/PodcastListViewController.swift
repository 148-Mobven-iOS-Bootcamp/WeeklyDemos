//
//  PodcastListViewController.swift
//  MVVM
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import UIKit

class PodcastListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
    }

    var viewModel: PodcastListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    private var podcasts: [PodcastListPresentation] = []
}

extension PodcastListViewController: PodcastListViewModelDelegate {
    func handleOutput(_ output: PodcastListViewModelOutput) {
        switch output {
        case .showPodcastList(let podcasts):
            self.podcasts = podcasts

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func navigate(to route: PodcastListViewRoute) {
        switch route {
        case .showPodcastDetail(let podcast):
            break
//            let viewController = PodcastDetailBuilder.build(with: podcast)
//            self.show(viewController, sender: self)
        }
    }
}

extension PodcastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(indexPath)
    }
}

extension PodcastListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.textLabel?.text = podcasts[indexPath.row].title
        return cell
    }
}

