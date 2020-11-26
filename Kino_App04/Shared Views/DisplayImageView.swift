//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by jose francisco morales on 04/09/2020.
//

import SwiftUI
import KingfisherSwiftUI


struct DisplayImageView<Content: View>: View {
    var poster: Image
    var view: Content
    
    init(poster: Image, info: Content) {
        self.poster = poster
            self.view = info
        }
    
    
    var body: some View {
        ZStack{
             
            poster
                .resizable()
                .scaledToFill()
                .clipped()
            VStack {
                
                
               Spacer()
                HStack {
                    view
                    Spacer()
                }

            }//.background(LinearGradient.blackOpacityGradient)
            //.background(LinearGradient.blackOpacityGradientUp)
                
           
            
        }
        
        .foregroundColor(.white)
    }
}

struct TopPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack { Color.black
            .edgesIgnoringSafeArea(.all)
            DisplayImageView(poster: Image("wallpaper_header"), info: Text("") )
        }
    }
}
