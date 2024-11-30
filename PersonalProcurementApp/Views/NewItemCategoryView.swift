//
//  NewItemCategoryView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 15/10/2024.
//

import SwiftUI
import SwiftData

import os

struct NewItemCategoryView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @State var item_category: ItemCategory = ItemCategory()
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "NewItemCategoryView")
    
    var body: some View {
        HStack {
            Spacer()
            Button("Save") {
                logger.info("Saving new item category \(item_category.name)")
                modelContext.insert(item_category)
                self.presentationMode.wrappedValue.dismiss()
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
        VStack {
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
        }
        .onAppear() {
            logger.info("NewItemCategoryView active")
        }
        Spacer()
    }
}

#Preview {
    NewItemCategoryView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
