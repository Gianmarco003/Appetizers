//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            //This method can use cache
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            //This method cannot use cache (I'm not sure)
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("\(appetizer.price, specifier: "%.2f")€")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView(appetizer: MockData.sampleAppetizer)
    }
}
