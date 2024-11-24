//
//  RecurringEventService.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 10/11/2024.
//

import Foundation
import SwiftData
import SwiftUI

final class RecurringEventService {
    @Query var all_items: [Item]
    
    var recurring_items: [Item] {
        all_items.filter { item in
            item.reccure_config.is_reccuring == true
        }
    }
    
    func resetItems() {
        for item in recurring_items {
            let calendar = Calendar.current
            var unit_type: Calendar.Component
            
            switch item.reccure_config.type {
            case .Yearly:
                unit_type = Calendar.Component.year
            case .Monthly:
                unit_type = Calendar.Component.month
            case .Weekly:
                unit_type = Calendar.Component.weekOfYear
            case .Daily:
                unit_type = Calendar.Component.day
            }
            
            if let targetDate = calendar.date(byAdding: unit_type, value: item.reccure_config.recurre_unit, to: item.reccure_config.last_recurre) {
                if Date.now > targetDate {
                    if item.is_procured == true {
                        item.is_procured = false
                    }
                }
            }
        }
    }
}
