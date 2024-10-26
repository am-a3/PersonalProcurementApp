//
//  ShopsView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

struct ShopsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var shops: [Shop]
    
    var body: some View {
        VStack {
            HStack {
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
            ForEach(shops) { shop in
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
            Spacer()
        }
    }
}

#Preview {
    ShopsView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
