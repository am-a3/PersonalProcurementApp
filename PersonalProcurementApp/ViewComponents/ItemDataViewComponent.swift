//
//  ItemDataViewComponent.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 09/11/2024.
//

import SwiftUI

import os

struct ItemDataViewComponent: View {
    let shops: [Shop]
    let item_categories: [ItemCategory]
    @Bindable var item: Item
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemDataViewComponent")
    
    var body: some View {
        //Name field:
        HStack {
            Text("Name:")
                .padding(.leading, 20)
                .bold()
            TextField(
                item.name,
                text: $item.name,
                axis: .vertical
            )
            Spacer()
        }
        .padding(.top, 30)
        //Quantity field:
        HStack {
            Text("Quantity:")
                .padding(.leading, 20)
                .bold()
            TextField(
                String(item.quantity),
                value: $item.quantity,
                format: .number
            )
            Spacer()
        }
        .padding(.top, 1)
        //Status field:
        HStack {
            Text("Status:")
                .padding(.leading, 20)
                .bold()
            Button(item.is_procured ? "Done" : "Pending") {
                item.is_procured = !item.is_procured
                logger.info("Item \(item.name) status changed to \(item.is_procured.description)")
            }
            .foregroundColor(item.is_procured ? .green : .red)
            Spacer()
        }
        .padding(.top, 1)
        //Details field:
        HStack {
            Text("Details:")
                .padding(.leading, 20)
                .bold()
            TextField(
                item.details,
                text: $item.details,
                axis: .vertical
            )
            Spacer()
        }
        .padding(.top, 1)
        Divider()
        //Shop field:
        ItemShopSelectViewComponent(shops: shops, item: item)
        Divider()
        //Categories field:
        ItemCategorySelectViewComponent(item: item, item_categories: item_categories)
        Spacer()
    }
}

#Preview {
    ItemDataViewComponent(shops: [], item_categories: [], item: Item())
}
