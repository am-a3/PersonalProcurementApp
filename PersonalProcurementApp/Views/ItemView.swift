//
//  ItemView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 13/10/2024.
//

import SwiftUI
import SwiftData
import os

struct ItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var item: Item
    
    @Query var shops: [Shop]
    @Query var item_categories: [ItemCategory]
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemView")
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Button("Delete") {
                        logger.info("Deleting item \(item.name)")
                        modelContext.delete(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(.red)
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                    Button("Save") {
                        logger.info("Saving item \(item.name)")
                        modelContext.insert(item)
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
                ItemDataViewComponent(shops: shops, item_categories: item_categories, item: item)
                ItemRecurringConfigViewComponent(item: item)
            }
        }
        .onAppear() {
            logger.info("ItemView active")
        }
    }
}


#Preview {
    ItemView(item: Item(name: "Test1", quantity: 2, details: "Test item"))
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
