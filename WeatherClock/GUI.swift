//
//  GUI.swift
//  WeatherClock
//
//  Created by Maloney, Grant P. (MU-Student) on 2/17/18.
//  Copyright © 2018 Maloney, Grant P. (MU-Student). All rights reserved.
//

import Foundation
import UIKit

class GUI {
    
    public static func refresh(topDegree: UILabel, topLocation: UILabel, topFeelsLike: UILabel, lowDegree: UILabel, lowLocation: UILabel, lowFeelsLike: UILabel, cities: [City]) {
        topDegree.text = cities[0].printCurrentTemperature()
        topLocation.text = cities[0].getCityName()
        topFeelsLike.text = "Feels like \(cities[0].printFeelsLikeTemperature())"
        
        lowDegree.text = cities[1].printCurrentTemperature()
        lowLocation.text = cities[1].getCityName()
        lowFeelsLike.text = "Feels like \(cities[1].printFeelsLikeTemperature())"
    }
    
}
