//
//  OrderView.swift
//  iDine
//
//  Created by Christian Collins on 9/9/26.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationStack {
            List {
                Section{
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
