//
//  activityview.swift
//  NetflixClone
//
//  Created by jose francisco morales on 13/09/2020.
//

import SwiftUI

struct ActivityIndicatorView: View {
    var body: some View {
        ActivityIndicator(style: .medium, animate: .constant(true))
            .configure {
                $0.color = .white
            }
    }
}

struct ActivityIndicator: UIViewRepresentable {

    let style: UIActivityIndicatorView.Style
    @Binding var animate: Bool

    private let spinner: UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium))

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        spinner.style = style
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        animate ? uiView.startAnimating() : uiView.stopAnimating()
    }

    func configure(_ indicator: (UIActivityIndicatorView) -> Void) -> some View {
        indicator(spinner)
        return self
    }
}






struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{ Color.black.edgesIgnoringSafeArea(.all)
        ActivityIndicatorView()
        }
    }
}
