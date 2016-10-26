//
//  DoubleExtensions.swift
//  EZSwiftExtensionsExample
//
//  Created by Goktug Yilmaz on 12/19/15.
//  Copyright © 2015 Goktug Yilmaz. All rights reserved.
//

import UIKit

extension Double {
    /// EZSE: Converts Double to String
    public var toString: String { return String(self) }
    /// EZSE: Converts Double to Int
    public var toInt: Int { return Int(self) }


    /// EZSE: Returns a Double Ceil to decimal
    public func getCeiledByPlaces(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ceil(self * divisor) / divisor
    }
}


