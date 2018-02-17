//
//  City.swift
//  WeatherClock
//
//  Created by Maloney, Grant P. (MU-Student) on 2/17/18.
//  Copyright © 2018 Maloney, Grant P. (MU-Student). All rights reserved.
//

import Foundation

class City {
    private var cityName: String
    private var cityURL: String
    private var cityTimezone: String
    
    private var currentWeather: Weather?
    
    init(cityName: String, cityURL: String, cityTimezone: String) {
        self.cityName = cityName
        self.cityURL = cityURL
        self.cityTimezone = cityTimezone
    }
    
    public func getCityName() -> String {
        return self.cityName
    }
    
    public func getCityURL() -> String {
        return self.cityURL
    }
    
    public func getCityTimezone() -> String {
        return self.cityTimezone
    }
    
    public func getCityWeather() -> Weather {
        return self.currentWeather!
    }
    
    public func printCurrentTemperature() -> String {
        return "\(getCityWeather().getFarenheit() ? getCityWeather().getCurrentTemperature() : getCityWeather().getCurrentTemperatureConversion())°F/\(getCityWeather().getFarenheit() ? getCityWeather().getCurrentTemperatureConversion() : getCityWeather().getCurrentTemperature())°C"
    }
    
    public func printFeelsLikeTemperature() -> String {
        return "\(getCityWeather().getFarenheit() ? getCityWeather().getFeelsLikeTemperature() : getCityWeather().getFeelsLikeTemperatureConversion())°F/\(getCityWeather().getFarenheit() ? getCityWeather().getFeelsLikeTemperatureConversion() : getCityWeather().getFeelsLikeTemperature())°C"
    }
    
    public func printCondensation() -> String {
        return "The current weather is \(getCityWeather().getCondensation().lowercased())"
    }
    
    public func updateWeather() {
        currentWeather = WeatherData.getWeather(cityURL: getCityURL())
    }
}
