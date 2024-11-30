//
//  CategorySelectViewComponent.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 08/11/2024.
//

import SwiftUI

import os

struct ItemCategorySelectViewComponent: View {
    let item_categories: [ItemCategory]
    var item: Item
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemCategorySelectViewComponent")
    
    init (item: Item, item_categories: [ItemCategory]) {
        self.item_categories = item_categories
        self.item = item
    }
    
    var body: some View {
        HStack {
            Text("Categories:")
                .padding(.leading, 20)
            Spacer()
        }
        ScrollView() {
            VStack {
                ForEach(item_categories){ ic in
                    HStack{
                        Text(ic.name)
                            .padding(.leading, 20)
                        Button(action: {
                            if !item.categories.contains(ic) {
                                item.categories.append(ic)
                                logger.info("Item \(item.name) added to categories \(item.categories)")
                            }
                            else {
                                if let index = item.categories.firstIndex(of: ic) {
                                    item.categories.remove(at: index)
                                    logger.info("Item \(item.name) removed to categories \(item.categories)")
                                }
                            }
                        }, label: {
                            Label("",systemImage: item.categories.contains(ic) ? "checkmark.square.fill" : "square")
                                .labelStyle(.iconOnly)
                                .foregroundColor(item.categories.contains(ic) ? .blue : .blue)
                                .imageScale(.large)
                        })
                        .padding(.trailing, 8)
                        Spacer()
                    }
                }
                .padding(.top, 1)
            }
        }
    }
}

#Preview {
    ItemCategorySelectViewComponent(item: Item(), item_categories: [])
}
