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
    @State var item: Item = Item() //need to investigate, seems bindable variable don't work
    
    @Query var shops: [Shop]
    @Query var item_categories: [ItemCategory]
    
    var body: some View {
        ScrollView {
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
                ItemDataViewComponent(shops: shops, item_categories: item_categories, item: item)
                ItemRecurringConfigViewComponent(item: item)
            }
        }
    }
}

#Preview {
    NewItemView()
        .modelContainer(for: [Item.self, Shop.self, ItemCategory.self], inMemory: true)
}
