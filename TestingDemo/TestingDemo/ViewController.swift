//
//  ViewController.swift
//  TestingDemo
//
//  Created by Semih Emre ÜNLÜ on 30.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!

    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plusButtonTapped(_ sender: Any) {
        count += 1
        countLabel.text = String(count)
    }

}

