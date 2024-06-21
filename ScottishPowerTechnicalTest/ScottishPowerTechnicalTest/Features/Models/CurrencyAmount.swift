//
//  CurrencyAmount.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

class CurrencyAmount: Decodable, Equatable {
    
    // MARK: - Properties (Private)
    
    private let underlyingValue: Double
    
    // MARK: - Initializer
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let double = try container.decode(Double.self)
        self.underlyingValue = double
    }
        
    init(underlyingValue: Double) {
        self.underlyingValue = underlyingValue
    }
    
    static func == (lhs: CurrencyAmount, rhs: CurrencyAmount) -> Bool {
        lhs.underlyingValue == rhs.underlyingValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.underlyingValue)
    }
    
    /// Returns the currency amount as a formatted amount eg: `£10.55`
    /// - Returns: String value
    func formattedAmount() -> String {
        return String(format: "£%.02f", self.underlyingValue)
    }
}

// MARK: - Hashable Conformance

extension CurrencyAmount: Hashable {}
