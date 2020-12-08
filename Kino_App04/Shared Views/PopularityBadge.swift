//
//  PopularityBadge.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 16/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

public struct PopularityBadge : View {
    public let score: Float
    public let nvotes: Int
    public let textColor: Color
    
    @State private var isDisplayed = false
    
    public init(score: Float, textColor: Color = .primary, nvotes: Int) {
        self.score = score
        self.textColor = textColor
        self.nvotes = nvotes
    }
    
    var scoreColor: Color {
        get {
            if score < 4 {
                return .red
            } else if score < 6 {
                return .orange
            } else if score < 7.5 {
                return .yellow
            }
            return .green
        }
    }
    
    var overlay: some View {
        ZStack {
            Circle()
                .trim(from: 0,
                      to: isDisplayed ? CGFloat(score)/10  : 0)
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [1]))
                .foregroundColor(scoreColor)
                .animation(Animation.interpolatingSpring(stiffness: 6, damping: 1).delay(0.01))
        }
        .rotationEffect(.degrees(-90))
        .onAppear {
            self.isDisplayed = true
        }
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.clear)
                .frame(width: 40)
                .overlay(overlay)
                .shadow(color: scoreColor, radius: 4)
            VStack{
            Text("\(score, specifier: "%.1f")")
                .font(Font.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(textColor)
                Text("\(nvotes)").font(Font.system(size: 7)).foregroundColor(.gray)
            }
            }
            .frame(width: 40, height: 40)
    }
}

#if DEBUG
struct PopularityBadge_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            PopularityBadge(score: 8.0, nvotes: 100)
            PopularityBadge(score: 1.0, nvotes: 100)
            PopularityBadge(score: 3.0, nvotes: 100)
            PopularityBadge(score: 5.0, nvotes: 100)
        }
    }
}
#endif
