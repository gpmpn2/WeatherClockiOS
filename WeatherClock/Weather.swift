//
//  Weather.swift
//  WeatherClock
//
//  Created by Maloney, Grant P. (MU-Student) on 2/17/18.
//  Copyright © 2018 Maloney, Grant P. (MU-Student). All rights reserved.
//

import Foundation

class Weather {
    private var currentTemperature: Int;
    private var feelsLikeTemperature: Int;
    private var condensation: String;
    private var farenheit: Bool;
    private var currentTemperatureConversion: Int;
    private var feelsLikeTemperatureConversion: Int;
    
    init(currentTemperature: Int, feelsLikeTemperature: Int, condensation: String, farenheit: Bool) {
        self.currentTemperature = currentTemperature
        self.feelsLikeTemperature = feelsLikeTemperature
        self.condensation = condensation
        self.farenheit = farenheit
        self.currentTemperatureConversion = 0
        self.feelsLikeTemperatureConversion = 0
        
        setCurrentTemperatureConversion(temp: setConversion(temp: currentTemperature))
        setFeelsLikeTemperatureConversion(temp: setConversion(temp: feelsLikeTemperature))
    }
    
    public func celciusToFarenheit(temp: Int) -> Int {
        return Int(((Double(temp) * (1.8)) + 32));
    }
    
    public func farenheitToCelcius(temp: Int) -> Int {
        return Int(round(((Double(temp) - 32)) * 0.5555));
    }
    
    public func setConversion(temp: Int) -> Int{
        if farenheit {
            return farenheitToCelcius(temp: temp)
        }
        return celciusToFarenheit(temp: temp)
    }
    
    public func getCurrentTemperature() -> Int {
        return self.currentTemperature
    }
    
    public func getFeelsLikeTemperature() -> Int{
        return self.feelsLikeTemperature
    }
    
    public func getCondensation() -> String {
        return self.condensation
    }
    
    public func getFarenheit() -> Bool {
        return self.farenheit
    }
    
    public func getCurrentTemperatureConversion() -> Int {
        return self.currentTemperatureConversion
    }
    
    public func getFeelsLikeTemperatureConversion() -> Int {
        return self.feelsLikeTemperatureConversion
    }
    
    public func setCurrentTemperature(temp: Int) {
        self.currentTemperature = temp
    }
    
    public func setFeelsLikeTemperature(temp: Int) {
        self.feelsLikeTemperature = temp
    }
    
    public func setCondensation(condensation: String) {
        self.condensation = condensation
    }
    
    public func setFarenheit(far: Bool) {
        self.farenheit = far
    }
    
    public func setCurrentTemperatureConversion(temp: Int) {
        self.currentTemperatureConversion = temp
    }
    
    public func setFeelsLikeTemperatureConversion(temp: Int) {
        self.feelsLikeTemperatureConversion = temp
    }
}
