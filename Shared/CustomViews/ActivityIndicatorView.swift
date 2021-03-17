//
//  ActivityIndicatorView.swift
//  GraphQL (iOS)
//
//  Created by Pallab Maiti on 17/03/21.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating == true ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
