//
//  BoolExtensions.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 29/10/2024.
//

import Foundation

extension Bool: Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        // the only true inequality is false < true
        !lhs && rhs
    }
}
