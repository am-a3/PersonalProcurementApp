//
//  ContentView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: ItemsView()) {
                        Text("Items")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(.blue)
                    .padding(.bottom, 10)
                    Spacer()
                }
                HStack {
                    Spacer()
                    NavigationLink(destination: ShopsView()) {
                        Text("Shops")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(.blue)
                    .padding(.bottom, 10)
                    Spacer()
                }
                HStack {
                    Spacer()
                    NavigationLink(destination: ItemCategoriesView()) {
                        Text("Item categories")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.white)
                    .background(.blue)
                    .padding(.bottom, 10)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
