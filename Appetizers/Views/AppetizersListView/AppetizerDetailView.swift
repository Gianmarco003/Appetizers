//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Gianmarco on 11/02/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225 )
            Text(appetizer.name)
                .font(.title)
                .fontWeight(.medium)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            Spacer()
            HStack(spacing: 30) {
                VStack (spacing: 5) {
                    Text("Calories")
                        .fontWeight(.bold)
                        .font(.caption)
                    Text("\(appetizer.calories)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack (spacing: 5) {
                    Text("Carbs")
                        .fontWeight(.bold)
                        .font(.caption)
                    Text("\(appetizer.carbs)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack (spacing: 5) {
                    Text("Protein")
                        .fontWeight(.bold)
                        .font(.caption)
                    Text("\(appetizer.protein)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }
            Button {
                
            } label: {
                Text("\(appetizer.price, specifier: "%.2f")€ - Add to order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
            }
            .buttonStyle(.borderedProminent)
            .tint(.brandPrimary  )
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        . cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.black)
                }
            }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}
