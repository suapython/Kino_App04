//
//  VideoPreviewImage.swift
//  NetflixClone
//
//  Created by jose francisco morales on 06/09/2020.
//
import SwiftUI
import KingfisherSwiftUI

struct VideoPreviewImage: View {
    var imageURL: String
    var videoURL: String
    
    @State private var showingVideoPlayer = false
    
    var body: some View {
        
        ZStack {
            KFImage(URL(string: imageURL)! )
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                showingVideoPlayer = true
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showingVideoPlayer, content: {
               //  SheetVideoPlayer(videos: "h6hZkvrFIj0")
                 Text("Video player")
               
            })
        }
        
        
    }
}



struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL:
                           "https://www.youtube.com/embed/v=h6hZkvrFIj0"
        )
    }
}
