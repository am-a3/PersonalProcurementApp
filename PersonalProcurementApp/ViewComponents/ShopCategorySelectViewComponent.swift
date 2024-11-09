//
//  ShopCategorySelectViewComponent.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 09/11/2024.
//

import SwiftUI

struct ShopCategorySelectViewComponent: View {
    var item_categories: [ItemCategory]
    var shop: Shop
    
    var body: some View {
        HStack {
            Text("Item categories:")
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
                            if !shop.categories.contains(ic) {
                                shop.categories.append(ic)
                            }
                            else {
                                if let index = shop.categories.firstIndex(of: ic) {
                                    shop.categories.remove(at: index)
                                }
                            }
                        }, label: {
                            Label("",systemImage: shop.categories.contains(ic) ? "checkmark.square.fill" : "square")
                                .labelStyle(.iconOnly)
                                .foregroundColor(shop.categories.contains(ic) ? .blue : .blue)
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
    ShopCategorySelectViewComponent(item_categories: [], shop: Shop())
}
