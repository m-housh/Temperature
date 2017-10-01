//
//  TemperatureType.swift
//  TemperaturePackageDescription
//
//  Created by Michael Housh on 10/1/17.
//

// import Foundation

enum TemperatureType {
    case fahrenheit, celsius, kelvin, rankine
}


extension TemperatureType: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .celsius:
            return "°C"
        case .fahrenheit:
            return "°F"
        case .kelvin:
            return "°K"
        case .rankine:
            return "°R"
            
        }
    }
}

