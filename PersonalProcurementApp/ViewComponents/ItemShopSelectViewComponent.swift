//
//  ItemShopSelectViewComponent.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 09/11/2024.
//

import SwiftUI

import os

struct ItemShopSelectViewComponent: View {
    let shops: [Shop]
    var item: Item
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemShopSelectViewComponent")
    
    var body: some View {
        HStack {
            Text("Shop:")
                .padding(.leading, 20)
            Spacer()
        }
        ScrollView() {
            VStack {
                ForEach(shops){ shop in
                    HStack{
                        Text(shop.name)
                            .padding(.leading, 20)
                        Button(action: {
                            if !item.shops.contains(shop) {
                                item.shops.append(shop)
                                logger.info("Item \(item.name) added to shop \(shop.name)")
                            }
                            else {
                                if let index = item.shops.firstIndex(of: shop) {
                                    item.shops.remove(at: index)
                                    logger.info("Item \(item.name) removed from shop \(shop.name)")
                                }
                            }
                        }, label: {
                            Label("",systemImage: item.shops.contains(shop) ? "checkmark.square.fill" : "square")
                                .labelStyle(.iconOnly)
                                .foregroundColor(item.shops.contains(shop) ? .blue : .blue)
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
    ItemShopSelectViewComponent(shops: [], item: Item())
}
