//
//  AccountView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView() {
            Form {
                Section (header: Text("Personal info")) {
                    TextField("First name", text: $viewModel.user.firstName)
                    TextField("Last name", text: $viewModel.user.lastName)
                    TextField("email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthdate", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section (header: Text("Request")) {
                    Toggle("Extra napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
            }
            .navigationTitle("Account")
        }
        .onAppear {
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}