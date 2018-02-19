//
//  ViewController.swift
//  WeatherClock
//
//  Created by Maloney, Grant P. (MU-Student) on 2/17/18.
//  Copyright © 2018 Maloney, Grant P. (MU-Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topDegree: UILabel!
    @IBOutlet weak var topLocation: UILabel!
    @IBOutlet weak var topFeelsLike: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    
    @IBOutlet weak var lowDegree: UILabel!
    @IBOutlet weak var lowLocation: UILabel!
    @IBOutlet weak var lowFeelsLike: UILabel!
    @IBOutlet weak var lowView: UIView!
    @IBOutlet weak var lowImageView: UIImageView!
    
    public var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topImageView.image = UIImage(named: "topBackground.png")!
        
        self.lowImageView.image = UIImage(named: "lowBackground.png")!
        
        loadCities()
        
        var clockTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        var weatherTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(updateWeather), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        
    }
    
    @objc func updateWeather() {
        for city in self.cities {
            city.updateWeather()
        }
        
        GUI.refresh(topDegree: self.topDegree, topLocation: self.topLocation, topFeelsLike: self.topFeelsLike, lowDegree: self.lowDegree, lowLocation: self.lowLocation, lowFeelsLike: self.lowFeelsLike, cities: self.cities)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func loadCities() {
        cities.insert(City(cityName: "Columbia, Missouri", cityURL: "https://www.accuweather.com/en/us/columbia-mo/65201/weather-forecast/329434", cityTimezone: "CST"), at: 0)
        cities.insert(City(cityName: "Cape Town, South Africa", cityURL: "https://www.accuweather.com/en/za/cape-town/306633/weather-forecast/306633", cityTimezone: "Africa/Cairo"), at: 1)
        
        for city in cities {
            city.updateWeather()
        }
    }
}

