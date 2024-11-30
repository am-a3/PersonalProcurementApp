//
//  ShopView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 18/10/2024.
//

import SwiftUI
import SwiftData

import os

struct ShopView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var shop: Shop

    @Query(sort: \Item.is_procured) var allItems: [Item]
    @Query var item_categories: [ItemCategory]
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ShopView")

    var filteredItems: [Item] {
        allItems.filter { item in
            (item.shops.contains { $0.id == shop.id } || item.categories.contains {ct in shop.categories.contains(ct)}) && item.is_procured == false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Delete") {
                    logger.info("Deleting shop \(shop.name)")
                    modelContext.delete(shop)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.red)
                .padding(.top, 10)
                .padding(.trailing, 10)
                Button("Save") {
                    logger.info("Saving shop \(shop.name)")
                    modelContext.insert(shop)
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
                    shop.name,
                    text: $shop.name,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 30)
            HStack {
                Text("Details:")
                    .padding(.leading, 20)
                TextField(
                    shop.details,
                    text: $shop.details,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 1)
            HStack {
                Text("Address:")
                    .padding(.leading, 20)
                TextField(
                    shop.address,
                    text: $shop.address,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 1)
            //Items select:
            HStack {
                Text("Items:")
                    .padding(.leading, 20)
                Spacer()
            }
            ScrollView() {
                VStack {
                    ForEach(filteredItems) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Button(action: {
                                item.is_procured = !item.is_procured
                                logger.info("Toggling \(item.name) is_procured to \(item.is_procured.description)")
                            }, label: {
                                Label("",systemImage: item.is_procured ? "checkmark.square.fill" : "square")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(.blue)
                                    .imageScale(.large)
                            })
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .padding(.trailing, 20)
                        Divider()
                    }
                }
                .padding(.top, 1)
            }
            .onAppear() {
                logger.info("ShopView active")
            }
            //Item category assignment:
            ShopCategorySelectViewComponent(item_categories: item_categories, shop: shop)
            Spacer()
        }
    }
}

#Preview {
    ShopView(shop: Shop(name: "Test", details: "Details", address: "Address"))
}
