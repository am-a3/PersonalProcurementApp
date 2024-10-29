//
//  ItemsView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 12/10/2024.
//

import SwiftUI
import SwiftData

struct ItemsView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Item.is_procured) var items: [Item]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: NewItemView()) {
                    Text("New item")
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
            ForEach(items) { item in
                HStack {
                    NavigationLink(destination: ItemView(item: item)){
                        Text(item.name)
                    }
                    .padding(.leading, 8)
                    Spacer()
                    Text("Qty: \(item.quantity)")
                        .padding(.trailing, 10)
                    Button(action: {
                        item.is_procured.toggle()
                        modelContext.insert(item)
                    }, label: {
                        Label("",systemImage: item.is_procured ? "checkmark.square.fill" : "square")
                            .labelStyle(.iconOnly)
                            .foregroundColor(item.is_procured ? .blue : .blue)
                            .imageScale(.large)
                    })
                    .padding(.trailing, 8)
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
    ItemsView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
