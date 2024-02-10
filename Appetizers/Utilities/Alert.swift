//
//  Alert.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: Text("Server error"),
                                              message: Text("Data received from the server was invalid. Please contact support."),
                                              dismissButton: .default(Text("Ok")))
    static let invalidResponse  = AlertItem(title: Text("Server error"),
                                              message: Text("Invalid response from the server. Please try again later or contact support."),
                                              dismissButton: .default(Text("Ok")))
    static let invalidURL       = AlertItem(title: Text("Server error"),
                                              message: Text("There was an issue connecting to the server. If this persist, please contact support."),
                                              dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server error"),
                                              message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                              dismissButton: .default(Text("Ok")))
}
