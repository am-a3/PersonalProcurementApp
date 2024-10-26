//
//  Shop.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import Foundation
import SwiftData

@Model
final class Shop {
    @Attribute(.unique) let id = UUID()
    var name: String
    var details: String
    var address: String
    var location_latitude: Double
    var location_longitude: Double
    var modified_timestamp: Date
    var created_timestamp: Date
    var items: [Item]
    @Relationship(inverse: \ItemCategory.shops) var categories: [ItemCategory]
    
    init() {
        self.name = ""
        self.details = ""
        self.address = ""
        self.location_latitude = 0.0
        self.location_longitude = 0.0
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
        self.categories = []
        self.items = []
    }
    
    init(name: String, details: String, address: String) {
        self.name = name
        self.details = details
        self.address = address
        self.location_latitude = 0.0
        self.location_longitude = 0.0
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
        self.categories = []
        self.items = []
    }
    
    init(name: String, details: String, address: String,
         latitude: Double, longitude: Double) {
        self.name = name
        self.details = details
        self.address = address
        self.location_latitude = latitude
        self.location_longitude = longitude
        self.modified_timestamp = Date.now
        self.created_timestamp = Date.now
        self.categories = []
        self.items = []
    }
}
