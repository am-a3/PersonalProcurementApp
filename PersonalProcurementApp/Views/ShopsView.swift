//
//  ShopsView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

import os

struct ShopsView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var selectedSortOption: ShopSortOption = .name
    
    var sortDescriptor: SortDescriptor<Shop> {
        selectedSortOption.descriptor
    }
    
    @Query(sort: \Shop.name) var shops: [Shop]
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ShopsView")
    
    var body: some View {
        VStack {
            HStack {
                Picker("Sort by", selection: $selectedSortOption) {
                    ForEach(ShopSortOption.allCases, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                Spacer()
                NavigationLink(destination: NewShopView()) {
                    Text("New shop")
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
                    ForEach(shops.sorted(using: [sortDescriptor])) { shop in
                        HStack {
                            NavigationLink(destination: ShopView(shop: shop)){
                                Text(shop.name)
                            }
                            .padding(.leading, 8)
                            Spacer()
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        Divider()
                    }
                }
            }
            .onAppear() {
                logger.info("ShopsView active")
            }
            Spacer()
        }
    }
}

#Preview {
    ShopsView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
