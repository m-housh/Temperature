//
//  TemperatureConvertible.swift
//  TemperaturePackageDescription
//
//  Created by Michael Housh on 10/1/17.
//

// import Foundation

// The interface that's implemented to convert temperatures to
// from one type to another.

protocol TemperatureConvertible {
    
    var temperatureType: TemperatureType { get }
    var value: Double { get }
    
    func convert(to: TemperatureType) -> Self
    
}
