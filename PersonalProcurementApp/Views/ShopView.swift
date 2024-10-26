//
//  ShopView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 18/10/2024.
//

import SwiftUI
import SwiftData

struct ShopView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var shop: Shop

    @Query var allItems: [Item]

    var filteredItems: [Item] {
        allItems.filter { item in
            item.shops.contains { $0.name == shop.name }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Save") {
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
            HStack {
                VStack {
                    HStack {
                        Text("Items:")
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    ForEach(filteredItems) { item in
                        HStack {
                            Text(item.name)
                            Button(item.is_procured ? "Done" : "Pending") {
                                item.is_procured = !item.is_procured
                            }
                            .foregroundColor(item.is_procured ? .green : .red)
                            Spacer()
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        Divider()
                    }
                    Spacer()
                }
            }
            .padding(.top, 1)
            Spacer()
        }
    }
}

#Preview {
    ShopView(shop: Shop(name: "Test", details: "Details", address: "Address"))
}
