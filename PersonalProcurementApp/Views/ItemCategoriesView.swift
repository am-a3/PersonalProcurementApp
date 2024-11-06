//
//  ItemCategoriesView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

struct ItemCategoriesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var categories: [ItemCategory]
    
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: NewItemCategoryView()) {
                Text("New category")
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.blue)
            .padding(.top, 10)
            .padding(.trailing, 10)
        }
        Divider()
            .frame(height: 2)
            .background(Color.blue)
        ScrollView() {
            VStack {
                ForEach(categories) { category in
                    HStack {
                        NavigationLink(destination: ItemCategoryView(item_category: category)){
                            Text(category.name)
                        }
                        .padding(.leading, 8)
                        Spacer()
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    Divider()
                }
            }
        }
        Spacer()
    }
}

#Preview {
    ItemCategoriesView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
