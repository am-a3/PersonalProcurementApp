//
//  ItemSortOption.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 17/02/2025.
//
import Foundation
import SwiftData

enum ItemSortOption: String, CaseIterable {
    case name = "Name"
    case dateCreated = "Date created"
    
    var descriptor: SortDescriptor<Item> {
        switch self {
        case .name:
            return SortDescriptor(\Item.name, order: .forward)
        case .dateCreated:
            return SortDescriptor(\Item.created_timestamp, order: .reverse)
        }
    }
}
