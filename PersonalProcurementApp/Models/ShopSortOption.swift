//
//  ShopSortOption.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 19/02/2025.
//
import Foundation
import SwiftData

enum ShopSortOption: String, CaseIterable {
    case name = "Name"
    case dateCreated = "Date created"
    
    var descriptor: SortDescriptor<Shop> {
        switch self {
        case .name:
            return SortDescriptor(\Shop.name, order: .forward)
        case .dateCreated:
            return SortDescriptor(\Shop.created_timestamp, order: .reverse)
        }
    }
}
