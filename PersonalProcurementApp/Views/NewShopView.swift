//
//  NewShopView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 20/10/2024.
//

import SwiftUI
import SwiftData

struct NewShopView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var shop: Shop = Shop()
    @Query var item_categories: [ItemCategory]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Save") {
                    modelContext.insert(shop)
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
            //Item category assignment:
            ShopCategorySelectViewComponent(item_categories: item_categories, shop: shop)
            Spacer()
        }
    }
}

#Preview {
    NewShopView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
