//
//  ItemShopSelectViewComponent.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 09/11/2024.
//

import SwiftUI

struct ItemShopSelectViewComponent: View {
    let shops: [Shop]
    var item: Item
    
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
                            }
                            else {
                                if let index = item.shops.firstIndex(of: shop) {
                                    item.shops.remove(at: index)
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
