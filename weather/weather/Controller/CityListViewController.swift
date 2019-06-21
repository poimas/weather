//
//  CityListViewController.swift
//  weather
//
//  Created by user on 2019. 06. 20..
//  Copyright © 2019. poimas. All rights reserved.
//

import UIKit

class CityListViewController: UITableViewController {

    var detailViewController: CityDetailViewController? = nil
    let objects = [(city: "Budapest", county: "Pest"),
                   (city: "Debrecen", county: "Hajdú-Bihar"),
                   (city: "Szeged", county: "Csongrád"),
                   (city: "Veszprém", county: "Veszprém"),
                   (city: "Nevesincs", county: "Huszadik")]

    // MARK: - UI lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? CityDetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! CityDetailViewController
                controller.cityName = object.city
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CityCell

        let object = objects[indexPath.row]
        cell.name.text = object.city
        cell.county.text = object.county
        return cell
    }

}

