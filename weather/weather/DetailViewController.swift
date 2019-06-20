//
//  DetailViewController.swift
//  weather
//
//  Created by user on 2019. 06. 20..
//  Copyright © 2019. poimas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            title = detail
            if let label = detailDescriptionLabel {
                label.text = """
                Sorry, no data about this city.
                Please choose a different one.
                """
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

