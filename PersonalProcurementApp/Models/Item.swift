//
//  Item.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import Foundation
import SwiftData

enum ReccureType: String, CaseIterable, Identifiable, Codable {
    case Yearly = "Yearly"
    case Monthly = "Monthly"
    case Weekly = "Weekly"
    case Daily = "Daily"
    
    var id: Self { self }
}

@Model
final class Item {
    @Attribute(.unique) var id = UUID()
    var name: String
    var quantity: Int32
    var details: String
    var modified_timestamp: Date
    var created_timestamp: Date
    var is_procured: Bool
    var reccure_config: ReccureConfig
    @Relationship(inverse: \ItemCategory.items) var categories: [ItemCategory]
    @Relationship(inverse: \Shop.items) var shops: [Shop]
    
    struct ReccureConfig: Codable {
        public var is_reccuring: Bool
        public var type: ReccureType
        public var recurre_unit: Int
        public var last_recurre: Date
        
        init(is_reccuring: Bool, type: ReccureType, recurre_unit: Int, last_recurre: Date) {
            self.is_reccuring = is_reccuring
            self.type = type
            self.recurre_unit = recurre_unit
            self.last_recurre = last_recurre
        }
    }
    
    init() {
        self.name = ""
        self.quantity = 0
        self.details = ""
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
        self.is_procured = false
        self.reccure_config = .init(is_reccuring: false, type: .Daily, recurre_unit: 0, last_recurre: Date.now)
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
        self.reccure_config = .init(is_reccuring: false, type: .Daily, recurre_unit: 0, last_recurre: Date.now)
        self.categories = []
        self.shops = []
    }
}
