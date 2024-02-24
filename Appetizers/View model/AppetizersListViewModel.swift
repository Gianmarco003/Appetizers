//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

@MainActor final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                    print(error.localizedDescription)
//                }
//
//            }
//        }
//    }
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
            } catch {
                if let apError = error as? AppetizersError {
                    switch apError {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.genericError
                }
            }
            isLoading = false
        }
    }
}
