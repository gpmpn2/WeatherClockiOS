//
//  WeatherData.swift
//  WeatherClock
//
//  Created by Maloney, Grant P. (MU-Student) on 2/17/18.
//  Copyright © 2018 Maloney, Grant P. (MU-Student). All rights reserved.
//

import Foundation

class WeatherData {
    public static func getWeather(cityURL: String) -> Weather {
        let data: String = getURLSource(url: cityURL)
        
//        if data == "" {
//            return nil;
//        }
        
        return parseData(urlSource: data)
    }

    private static func parseData(urlSource: String) -> Weather {
        var newData = ""
        
        if let range = urlSource.range(of: "wrap-forecast-feed") {
            newData = String(urlSource[range.upperBound...])
        }
        
        if let range = newData.range(of: "See Hourly") {
            newData = String(newData[..<range.upperBound])
        }
        
        if let range = newData.range(of: "large-temp") {
            newData = String(newData[range.upperBound...])
        }
        
        if let range = newData.range(of: "<!-- /.info --> ") {
            newData = String(newData[..<range.upperBound])
        }
        
        newData = newData.replacingOccurrences(of: "                                            ", with: "\n")
        
        newData = newData.replacingOccurrences(of: "                                        ", with: "\n")
        
        if let range = newData.range(of: "<span class=\"cond\">Cloudy</span>") {
            newData = String(newData[..<range.upperBound])
        }
        
        newData = newData.replacingOccurrences(of: "</span>", with: "").replacingOccurrences(of: "</div>", with: "").replacingOccurrences(of: "RealFeel&#174", with: "").replacingOccurrences(of: "#176", with: "")
        
        var manipulatedData: [String] = newData.components(separatedBy: "<span class=")
        
        let currentTemperature: Int = Int(manipulatedData[0].replacingOccurrences(of: "&deg;", with: "").replacingOccurrences(of: "\">", with: "").replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\r", with: ""))!
        let feelsLikeTemperature: Int = Int(manipulatedData[2].replacingOccurrences(of: "\"realfeel\">", with: "").replacingOccurrences(of: "&", with: "").replacingOccurrences(of: "; ", with: "").replacingOccurrences(of: ";", with: "").replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\r", with: ""))!
        let farenheit: Bool = manipulatedData[1].replacingOccurrences(of: "\"temp-label\">", with: "").replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\n", with: "") == "F" ? true : false
        let condensation: String = manipulatedData[3].replacingOccurrences(of: "\"cond\">", with: "").replacingOccurrences(of: "\r", with: "").replacingOccurrences(of: "\n", with: "")
        
        return Weather(currentTemperature: currentTemperature, feelsLikeTemperature: feelsLikeTemperature, condensation: condensation, farenheit: farenheit)
    }

    public static func getURLSource(url: String) -> String {
        guard let myURL = URL(string: url) else {
            print("Error: \(url) doesn't seem to be a valid URL")
            return ""
        }
        
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            return myHTMLString
        } catch let error {
            print("Error: \(error)")
        }
        
        return ""
    }
}
