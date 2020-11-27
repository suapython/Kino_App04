//
//  SheetVideoPlayer.swift
//  Kino_App03
//
//  Created by jose francisco morales on 24/11/2020.
//

import SwiftUI

struct TrailerView: View {
   @Environment(\.presentationMode) var presentation
    var videos: [Videos]
    
    let screen = UIScreen.main.bounds

   var body: some View {
    
    ZStack {
       Color.black
           .edgesIgnoringSafeArea(.all)
        
          VStack {
       
       Button(action: {
            self.presentation.wrappedValue.dismiss()
            }, label: { Image(systemName: "xmark.circle")
                .font(.system(size: 28))
                .foregroundColor(.white)
            })
            VStack{
                ForEach(videos, id: \.self){ video in
                    WebView(videoID: video.key)
                        .frame(width: screen.width)
                .cornerRadius(12)
                //.padding(.horizontal, 24)
                //.padding(.top)
                }
          }
        Spacer()
      }
      .font(.title)
    }
   }
}


 




struct TrailorView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView( videos: exampleMovie.videosV)
    }
}
