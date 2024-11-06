//
//  ItemView.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 13/10/2024.
//

import SwiftUI
import SwiftData

struct ItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var item: Item
    
    @Query var shops: [Shop]
    @Query var item_categories: [ItemCategory]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Delete") {
                    modelContext.delete(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.red)
                .padding(.top, 10)
                .padding(.trailing, 10)
                Button("Save") {
                    modelContext.insert(item)
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
            //Name field:
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
            //Quantity field:
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
            //Status field:
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
            //Details field:
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
            //Shop field:
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
            //Categories field:
            HStack {
                Text("Categories:")
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
                                if !item.categories.contains(ic) {
                                    item.categories.append(ic)
                                }
                                else {
                                    if let index = item.categories.firstIndex(of: ic) {
                                        item.categories.remove(at: index)
                                    }
                                }
                            }, label: {
                                Label("",systemImage: item.categories.contains(ic) ? "checkmark.square.fill" : "square")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(item.categories.contains(ic) ? .blue : .blue)
                                    .imageScale(.large)
                            })
                            .padding(.trailing, 8)
                            Spacer()
                        }
                    }
                    .padding(.top, 1)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ItemView(item: Item(name: "Test1", quantity: 2, details: "Test item"))
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
