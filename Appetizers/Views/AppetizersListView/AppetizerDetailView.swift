//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Gianmarco on 11/02/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
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
                NutritionInfo(title: "Calories", value: appetizer.calories)
                NutritionInfo(title: "Carbs", value: appetizer.carbs)
                NutritionInfo(title: "Proteins", value: appetizer.protein)
            }
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                OrderButton(title: "\(appetizer.price, specifier: "%.2f")€ - Add to order")
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 10)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        . cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 5) {
            Text(title)
                .fontWeight(.bold)
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
