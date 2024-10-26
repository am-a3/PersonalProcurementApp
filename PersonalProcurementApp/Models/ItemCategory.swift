//
//  ItemCategory.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import Foundation
import SwiftData

@Model
final class ItemCategory {
    @Attribute(.unique) let id = UUID()
    var name: String
    var items: [Item]
    var shops: [Shop]
    var details: String
    var modified_timestamp: Date
    var created_timestamp: Date
    
    init (name: String) {
        self.name = name
        self.items = []
        self.shops = []
        self.details = ""
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
    }
}
