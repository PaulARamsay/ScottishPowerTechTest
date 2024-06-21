//
//  CurrencyAmount.swift
//  ScottishPowerTechnicalTest
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

class CurrencyAmount: Decodable, Equatable {
    
    private let underlyingValue: Double
    
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
    
    func formattedAmount() -> String {
        return String(format: "£%.02f", self.underlyingValue)
    }
}

extension CurrencyAmount: Hashable {}
