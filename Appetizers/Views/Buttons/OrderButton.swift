//
//  OrderButton.swift
//  Appetizers
//
//  Created by Gianmarco on 18/02/24.
//

import SwiftUI

struct OrderButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 250, height: 40)
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(title: "Hello")
    }
}
