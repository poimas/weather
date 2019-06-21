//
//  CityDetailViewController.swift
//  weather
//
//  Created by user on 2019. 06. 20..
//  Copyright © 2019. poimas. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    var cityName: String?
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    func loadData() {
        
        guard let cityName = cityName else { return }
        title = cityName
        guard let percentageName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(percentageName)&APPID=56f685e33cb3a095c30e756f7d2b0aa5") else {
                
                detailDescriptionLabel.text = "An error occured. Please try again later."
                return
        }
        
        let task = URLSession.shared.cityTask(with: url) { [weak self] city, response, error in
            DispatchQueue.main.async {

                guard let city = city, let temp = city.main?.temp else {
                    self?.detailDescriptionLabel.text = """
                    Sorry, no data about this city.
                    Please choose a different one.
                    """
                    return
                }
                let kelvin = 273.16
                let formatter = NumberFormatter()
                formatter.maximumFractionDigits = 1
                formatter.roundingMode = .down
                let celsius = formatter.string(from: NSNumber(value: temp - kelvin))
                self?.detailDescriptionLabel.text = celsius! + " °C"
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
}

