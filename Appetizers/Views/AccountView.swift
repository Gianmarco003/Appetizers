//
//  AccountView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView() {
            Text("Account view")
                .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
