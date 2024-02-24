//
//  ContentView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct PrincepsView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView{
            AppetizersListView()
                .tabItem {Label("Menù", systemImage: "menucard")}
            OrderView()
                .tabItem {Label("Order", systemImage: "bag")}
                .badge(order.items.count)
            AccountView()
                .tabItem {Label("Account", systemImage: "person.crop.circle")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PrincepsView()
    }
}
