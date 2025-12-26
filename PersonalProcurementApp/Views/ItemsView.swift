//
//  ItemsView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

import os

struct ItemsView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var selectedSortOption: ItemSortOption = .name
    
    var sortDescriptor: SortDescriptor<Item> {
        selectedSortOption.descriptor
    }
    
    @Query var items: [Item]
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemsView")
    
    var body: some View {
        HStack {
            Picker("Sort by", selection: $selectedSortOption) {
                ForEach(ItemSortOption.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            Spacer()
            NavigationLink(destination: NewItemView()) {
                Text("New item")
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
                ForEach(items.sorted(using: [SortDescriptor(\Item.is_procured), sortDescriptor]), id: \.self) { item in
                    HStack {
                        NavigationLink(destination: ItemView(item: item)){
                            Text(item.name)
                        }
                        .padding(.leading, 8)
                        Spacer()
                        Text("Qty: \(item.quantity)")
                            .padding(.trailing, 10)
                        Button(action: {
                            item.is_procured.toggle()
                            logger.info("Toggling \(item.name) is_procured to \(item.is_procured.description)")
                            modelContext.insert(item)
                        }, label: {
                            Label("",systemImage: item.is_procured ? "checkmark.square.fill" : "square")
                                .labelStyle(.iconOnly)
                                .foregroundColor(item.is_procured ? .blue : .blue)
                                .imageScale(.large)
                        })
                        .padding(.trailing, 8)
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    Divider()
                }
            }
        }
        .onAppear() {
            logger.info("ItemsView active")
        }
        Spacer()
    }
}

#Preview {
    ItemsView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
