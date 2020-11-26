//
//  SwiftUIVideoView.swift
//  NetflixClone
//
//  Created by jose francisco morales on 06/09/2020.
//

import SwiftUI
import AVKit

struct VideoPlayerURL: View {
    var url: String
    
    private var player: AVPlayer {
        AVPlayer(url: URL(string: url)!)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerURL(url: exampleVideoURL)
    }
}

