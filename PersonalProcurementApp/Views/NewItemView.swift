//
//  NewItemView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 15/10/2024.
//

import SwiftUI
import SwiftData

struct NewItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var item: Item = Item()
    
    @Query var shops: [Shop]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Save") {
                    modelContext.insert(item)
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
                    item.name,
                    text: $item.name,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 30)
            HStack {
                Text("Quantity:")
                .padding(.leading, 20)
                TextField(
                    String(item.quantity),
                    value: $item.quantity,
                    format: .number
                )
                Spacer()
            }
            .padding(.top, 1)
            HStack {
                Text("Status:")
                .padding(.leading, 20)
                Button(item.is_procured ? "Done" : "Pending") {
                    item.is_procured = !item.is_procured
                }
                .foregroundColor(item.is_procured ? .green : .red)
                Spacer()
            }
            .padding(.top, 1)
            HStack {
                Text("Details:")
                .padding(.leading, 20)
                TextField(
                    item.details,
                    text: $item.details,
                    axis: .vertical
                )
                Spacer()
            }
            .padding(.top, 1)
            HStack {
                Text("Shop:")
                .padding(.leading, 20)
                
                Spacer()
            }
            .padding(.top, 1)
            Spacer()
        }
    }
}

#Preview {
    NewItemView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}