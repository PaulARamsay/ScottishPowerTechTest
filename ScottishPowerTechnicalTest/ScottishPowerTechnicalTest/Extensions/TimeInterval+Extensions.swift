//
//  TimeInterval+Extensions.swift
//  Scottish Power Tech Test
//
//  Created by Paul Ramsay on 21/06/2024.
//

import Foundation

extension TimeInterval {
    
    var formattedInMinutesSeconds: String {
        String(format: "%02d:%02d", self.minute, self.second)
    }
    
    var minute: Int {
        Int((self / 60).truncatingRemainder(dividingBy: 60))
    }
    
    var second: Int {
        Int(truncatingRemainder(dividingBy: 60))
    }
}
