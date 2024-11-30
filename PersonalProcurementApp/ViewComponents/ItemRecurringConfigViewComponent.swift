//
//  ItemRecurringConfigViewComponent.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 23/11/2024.
//

import SwiftUI
import os

struct ItemRecurringConfigViewComponent: View {
    @State private var item: Item
    
    let logger = Logger(subsystem: "PersonalProcurementApp", category: "ItemRecurringConfigViewComponent")
    
    init (item: Item) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            Text("Recurring config:")
                .padding(.leading, 20)
            Spacer()
        }
        HStack {
            Text("Is recurring:")
                .padding(.leading, 20)
            Spacer()
            Button(action: {
                self.item.reccure_config.is_reccuring = !self.item.reccure_config.is_reccuring
                logger.info("Set item recurring state to \(self.item.reccure_config.is_reccuring)")
            }, label: {
                Label("",systemImage: self.item.reccure_config.is_reccuring ? "checkmark.square.fill" : "square")
                    .labelStyle(.iconOnly)
                    .foregroundColor(self.item.reccure_config.is_reccuring ? .blue : .blue)
                    .imageScale(.large)
            })
            .padding(.trailing, 8)
        }
        HStack {
            Text("Time unit:")
                .padding(.leading, 20)
            Spacer()
            Picker("Recurre unit", selection: $item.reccure_config.type) {
                ForEach(ReccureType.allCases, id: \.self) { unit in
                    Text(unit.rawValue).tag(unit)
                }
            }
        }
        HStack {
            Text("Units:")
                .padding(.leading, 20)
            TextField(
                String(item.reccure_config.recurre_unit),
                value: $item.reccure_config.recurre_unit,
                format: .number
            )
            Spacer()
        }
        Spacer()
    }
}

#Preview {
    ItemRecurringConfigViewComponent(item: Item())
}
