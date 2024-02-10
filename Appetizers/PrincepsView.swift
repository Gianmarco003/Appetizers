//
//  ContentView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct PrincepsView: View {
    
    var body: some View {
        TabView{
            AppetizersListView()
                .tabItem {
                    Image(systemName: "takeoutbag.and.cup.and.straw")
                    Text("Menù")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
        }
        .accentColor(.brandPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PrincepsView()
    }
}
