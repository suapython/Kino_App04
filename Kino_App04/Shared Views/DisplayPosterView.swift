//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by jose francisco morales on 04/09/2020.
//

import SwiftUI
import KingfisherSwiftUI


struct DisplayPosterView<Content: View>: View {
    var poster: String
    var view: Content
    
    
    init(poster: String, view: Content) {
        self.poster = poster
        self.view = view
    }
    
    
    var body: some View {
        
        VStack{
            ZStack{
                
                
                KFImage( ImagePath.original.path(poster: poster) )
                    .resizable()
                    .scaledToFill()
                    .clipped()
                VStack {
                    Spacer()
                    HStack {
                        view
                        Spacer()
                    }
                    
                }.background(LinearGradient.blackOpacityGradient)
                .background(LinearGradient.blackOpacityGradientUp)
                
            }
            .foregroundColor(.white)
            Spacer()
        }
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        let screen = UIScreen.main.bounds
        return 
        ZStack { Color.black
            .edgesIgnoringSafeArea(.all)
            DisplayPosterView(poster: exampleMovie.poster_pathM, view:  Text("") )
                .frame(width: screen.width)
        }
    }
}
