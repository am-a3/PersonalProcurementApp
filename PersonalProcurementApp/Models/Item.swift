//
//  Item.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    @Attribute(.unique) let id = UUID()
    var name: String
    var quantity: Int32
    var details: String
    var modified_timestamp: Date
    var created_timestamp: Date
    var is_procured: Bool
    @Relationship(inverse: \ItemCategory.items) var categories: [ItemCategory]
    @Relationship(inverse: \Shop.items) var shops: [Shop]
    
    init() {
        self.name = ""
        self.quantity = 0
        self.details = ""
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
        self.is_procured = false
        self.categories = []
        self.shops = []
    }
    
    init(name: String, quantity: Int32, details: String) {
        self.name = name
        self.quantity = quantity
        self.details = details
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
        self.is_procured = false
        self.categories = []
        self.shops = []
    }
}
