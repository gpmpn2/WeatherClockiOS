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
    @IBOutlet weak var topDate: UILabel!
    @IBOutlet weak var topCondensation: UILabel!
    
    @IBOutlet weak var lowDegree: UILabel!
    @IBOutlet weak var lowLocation: UILabel!
    @IBOutlet weak var lowFeelsLike: UILabel!
    @IBOutlet weak var lowView: UIView!
    @IBOutlet weak var lowImageView: UIImageView!
    @IBOutlet weak var lowDate: UILabel!
    @IBOutlet weak var lowCondensation: UILabel!
    
    public var cities: [City] = []
    
    public var tick: Int = 0
    
    override func viewDidLoad() {
        loadCities()
        
        super.viewDidLoad()
        
        var clockTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTime() {
        for city in self.cities {
            city.updateTime()
        }
    }
    
    @objc func update() {
        tick += 1
        
        for city in self.cities {
            city.updateTime()
        }
        
        if(tick == 30) {
            DispatchQueue.global(qos: .userInitiated).async {
                for city in self.cities {
                    city.updateWeather()
                }
            }
            tick = 0
        }
        
        GUI.refresh(topDegree: self.topDegree, topLocation: self.topLocation, topFeelsLike: self.topFeelsLike, lowDegree: self.lowDegree, lowLocation: self.lowLocation, lowFeelsLike: self.lowFeelsLike, topDate: self.topDate, lowDate: self.lowDate, topCondensation: self.topCondensation, lowCondensation: self.lowCondensation, topImageView: self.topImageView, lowImageView: self.lowImageView, cities: self.cities)
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
            city.updateTime()
        }
        
        GUI.refresh(topDegree: self.topDegree, topLocation: self.topLocation, topFeelsLike: self.topFeelsLike, lowDegree: self.lowDegree, lowLocation: self.lowLocation, lowFeelsLike: self.lowFeelsLike, topDate: self.topDate, lowDate: self.lowDate, topCondensation: self.topCondensation, lowCondensation: self.lowCondensation, topImageView: self.topImageView, lowImageView: self.lowImageView, cities: self.cities)
    }
}

