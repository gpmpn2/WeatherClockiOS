//
//  Time.swift
//  WeatherClock
//
//  Created by Maloney, Grant P. (MU-Student) on 2/19/18.
//  Copyright © 2018 Maloney, Grant P. (MU-Student). All rights reserved.
//

import Foundation

class Time {
    public static func getTime(timezone: String) -> String {
        let date = Date.init()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d, yyyy hh:mm:ss a z"
        dateFormatter.timeZone = TimeZone(identifier: timezone)!
        let str = dateFormatter.string(from: date)
        
        return str.replacingOccurrences(of: "GMT+2", with: "SAST")
    }
    
    public static func getMilitaryTime(time: String) -> Int {
        
        var hours: [String] = time.components(separatedBy: ":")
        
        let indexOne: String.Index = hours[0].index(hours[0].startIndex, offsetBy: (hours[0].count - 2))
        let indexTwo: String.Index = hours[0].index(hours[0].startIndex, offsetBy: (hours[0].count))
        
        let hour: String = String(hours[0][indexOne..<indexTwo])
        
        if ((time.contains("PM") && !time.contains("12:")) || ((time.contains("12:") && time.contains("AM")))) {
            return 12 + Int(hour)!
        } else {
            return Int(hour)!
        }
    }
}
