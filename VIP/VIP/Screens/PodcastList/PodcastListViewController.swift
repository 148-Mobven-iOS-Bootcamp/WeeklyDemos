//
//  PodcastListViewController.swift
//  VIP
//
//  Created by Semih Emre ÜNLÜ on 29.01.2022.
//

import UIKit

class PodcastListViewController: UIViewController, PodcastListViewProtocol {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        }
    }
    
    var interactor: PodcastListInteractorProtocol?
    var router: PodcastListRouterProtocol?
    
    private var podcasts: [PodcastListPresentation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
    }

    func handleOutput(_ output: PodcastListPresenterOutput) {
        switch output {
        case .showPodcastList(let podcasts):
            self.podcasts = podcasts

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension PodcastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigate(to: .showPodcastDetail(index: indexPath.row))
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


