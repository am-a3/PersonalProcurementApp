//
//  NewItemView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 15/10/2024.
//

import SwiftUI
import SwiftData
import os

struct NewItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @State var item: Item = Item() //need to investigate, seems bindable variable don't work
    
    @Query var shops: [Shop]
    @Query var item_categories: [ItemCategory]
    
    let logger = Logger(subsystem: "NewItemView", category: "NewItemView")
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Button("Save") {
                        logger.info("New item created")
                        modelContext.insert(item)
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
                ItemDataViewComponent(shops: shops, item_categories: item_categories, item: item)
                ItemRecurringConfigViewComponent(item: item)
            }
        }
        .onAppear() {
            logger.info("NewItemView active")
        }
    }
}

#Preview {
    NewItemView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
