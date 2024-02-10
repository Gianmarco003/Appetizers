//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView() {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListView(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
