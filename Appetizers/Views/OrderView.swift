//
//  OrderView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView() {
            ZStack{
                VStack{
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListView(appetizer: appetizer)
                        }
                        .onDelete (perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    Button {
                        print("Order placed ")
                    } label: {
                        OrderButton(title: "\(order.totalPrice, specifier: "%.2f")€ - Place order")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.brandPrimary)
                    .padding(.bottom, 20)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in yout order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("Place order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
