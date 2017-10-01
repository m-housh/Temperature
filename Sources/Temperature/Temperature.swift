
// import Foundation

struct Temperature {
    // Holds a temperature value and it's type.
    
    let temperatureType: TemperatureType
    let value: Double
    
    init(_ value: Double, type temperatureType: TemperatureType = .fahrenheit) {
        self.value = value
        self.temperatureType = temperatureType
    }
    
}

// MARK: CustomStringConvertible
extension Temperature: CustomStringConvertible {
    var description: String {
        return "\(value) \(temperatureType)"
    }
}

// MARK: Equatable
extension Temperature: Equatable {
    static func ==(lhs: Temperature, rhs: Temperature) -> Bool {
        return lhs.value == rhs.value && lhs.temperatureType == rhs.temperatureType
    }
}

// MARK: TemperatureConvertible
extension Temperature: TemperatureConvertible {
    
    private func convertToFahrenheit() -> Double {
        // converts `self.value` to fahrenheit.
        // based on the `self.temperatureType` value
        switch temperatureType {
        case .celsius:
            return value * 9 / 5 + 32
        case .kelvin:
            return value * 9 / 5 - 459.67
        case .rankine:
            return value - 459.67
        default: // we're already fahrenheit
            return value
        }
    }
    
    private func convertToCelsius() -> Double {
        // converts `self.value` to celsius
        // based on the `self.temperatureType` value
        switch temperatureType {
        case .fahrenheit:
            return (value - 32) * 5 / 9
        case .kelvin:
            return value - 273.15
        case .rankine:
            return (value - 491.67) * 5 / 9
        default: // we're already celsius
            return value
        }
    }
    
    private func convertToKelvin() -> Double {
        // converts `self.value` to kelvin
        // based on the `self.temperatureType` value
        switch temperatureType {
        case .fahrenheit:
            return (value + 459.67) * 5 / 9
        case .celsius:
            return value + 273.15
        case .rankine:
            return value * 5 / 9
        default: // we're already kelvin
            return value
        }
    }
    
    private func convertToRankine() -> Double {
        // converts `self.value` to rankine
        // based on the `self.temperatureType` value
        switch temperatureType {
        case .fahrenheit:
            return value + 459.67
        case .celsius:
            return (value + 273.15) * 9 / 5
        case .kelvin:
            return value * 9 / 5
        default: // we're already rankine
            return value
        }
    }
    
    func convert(to temperatureType: TemperatureType) -> Temperature {
        
        // holds the converted value that's used for
        // the converted temperature
        let value: Double
        
        // set's the converted value based on the `to temperatureType`
        // passed in (not to be confused with `self.temperatureType`)
        switch temperatureType{
        case .fahrenheit:
            value = convertToFahrenheit()
        case .celsius:
            value = convertToCelsius()
        case .kelvin:
            value = convertToKelvin()
        case .rankine:
            value = convertToRankine()
        }
        
        // Create a new `Temperature` with the value and
        // set it's type to the `to temperatureType` that
        // was passed in.
        return Temperature(value, type: temperatureType)
    }
}
