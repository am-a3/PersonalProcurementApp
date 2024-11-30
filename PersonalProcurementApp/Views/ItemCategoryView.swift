//
//  ItemCategoryView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 13/10/2024.
//

import SwiftUI
import SwiftData

import os

struct ItemCategoryView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var item_category: ItemCategory
    
    @Query var items: [Item]
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemCategoryView")
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Delete") {
                    logger.info("Deleting item category \(item_category.name)")
                    modelContext.delete(item_category)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.red)
                .padding(.top, 10)
                .padding(.trailing, 10)
                Button("Save") {
                    logger.info("Saving item category \(item_category.name)")
                    modelContext.insert(item_category)
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
            HStack {
                Text("Name:")
                .padding(.leading, 20)
                TextField(
                    item_category.name,
                    text: $item_category.name,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 30)
            HStack {
                Text("Details:")
                .padding(.leading, 20)
                TextField(
                    item_category.details,
                    text: $item_category.details,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 1)
            HStack {
                Text("Items:")
                    .padding(.leading, 20)
                Spacer()
            }
            ScrollView() {
                VStack {
                    ForEach(items){ item in
                        HStack{
                            Text(item.name)
                                .padding(.leading, 20)
                            Button(action: {
                                if !item_category.items.contains(item) {
                                    logger.info("Adding item \(item.name) to item category \(item_category.name)")
                                    item_category.items.append(item)
                                }
                            }, label: {
                                Label("",systemImage: item_category.items.contains(item) ? "checkmark.square.fill" : "square")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(item_category.items.contains(item) ? .blue : .blue)
                                    .imageScale(.large)
                            })
                            .padding(.trailing, 8)
                            Spacer()
                        }
                    }
                    .padding(.top, 1)
                }
            }
            .onAppear() {
                logger.info("ItemCategoryView active")
            }
            .padding(.top, 1)
            Spacer()
        }
    }
}

#Preview {
    ItemCategoryView(item_category: ItemCategory(name: "Test1"))
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
