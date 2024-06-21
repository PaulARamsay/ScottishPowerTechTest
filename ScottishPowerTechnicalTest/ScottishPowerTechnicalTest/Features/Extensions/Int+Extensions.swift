//
//  Int+Extensions.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

extension Int {

    func pluralised(nonPluralForm: String, pluralForm: String) -> String {
        if self == 1 || self == -1  {
            return "\(self.description) \(nonPluralForm)"
        } else {
            return "\(self.description) \(pluralForm)"
        }
    }
}
