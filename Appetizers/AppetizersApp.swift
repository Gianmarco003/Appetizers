//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            PrincepsView().environmentObject(order)
        }
    }
}
