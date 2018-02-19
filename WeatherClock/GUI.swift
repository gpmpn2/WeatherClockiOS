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
    
    public static func refresh(topDegree: UILabel, topLocation: UILabel, topFeelsLike: UILabel, lowDegree: UILabel, lowLocation: UILabel, lowFeelsLike: UILabel, topDate: UILabel, lowDate: UILabel, topCondensation: UILabel, lowCondensation: UILabel, cities: [City]) {
        
        topDegree.text = cities[0].printCurrentTemperature()
        topLocation.text = cities[0].getCityName()
        topFeelsLike.text = "Feels like \(cities[0].printFeelsLikeTemperature())"
        
        var time: String = cities[0].getCityTime()
        
        var militaryTime: Int = Time.getMilitaryTime(time: time)
        
        if militaryTime >= 19 || militaryTime <= 4 {
            topDegree.textColor = UIColor.white
            topLocation.textColor = UIColor.white
            topFeelsLike.textColor = UIColor.white
            topDate.textColor = UIColor.white
            topCondensation.textColor = UIColor.white
        } else {
            topDegree.textColor = UIColor.black
            topLocation.textColor = UIColor.black
            topFeelsLike.textColor = UIColor.black
            topDate.textColor = UIColor.black
            topCondensation.textColor = UIColor.black
        }
        
        topDate.text = time
        topCondensation.text = cities[0].printCondensation()
        
        lowDegree.text = cities[1].printCurrentTemperature()
        lowLocation.text = cities[1].getCityName()
        lowFeelsLike.text = "Feels like \(cities[1].printFeelsLikeTemperature())"
        
        time = cities[1].getCityTime()
        militaryTime = Time.getMilitaryTime(time: time)
        
        if militaryTime >= 19 || militaryTime <= 4 {
            lowDegree.textColor = UIColor.white
            lowLocation.textColor = UIColor.white
            lowFeelsLike.textColor = UIColor.white
            lowDate.textColor = UIColor.white
            lowCondensation.textColor = UIColor.white
        } else {
            lowDegree.textColor = UIColor.black
            lowLocation.textColor = UIColor.black
            lowFeelsLike.textColor = UIColor.black
            lowDate.textColor = UIColor.black
            lowCondensation.textColor = UIColor.black
        }
        
        lowDate.text = time
        lowCondensation.text = cities[1].printCondensation()
    }
    
}
