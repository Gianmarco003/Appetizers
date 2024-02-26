//
//  LoadingView.swift
//  Appetizers
//
//  Created by Gianmarco on 10/02/24.
//

import SwiftUI

//struct ActivityIndicator: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        let activityIndicatorView = UIActivityIndicatorView(style: .large)
//        activityIndicatorView.startAnimating()
//        return activityIndicatorView
//    }
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
//            ActivityIndicator()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }
}
