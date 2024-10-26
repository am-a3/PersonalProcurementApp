//
//  ItemCategoriesView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

struct ItemCategoriesView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ItemCategoriesView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
