//
//  TopImage.swift
//  Kino_App04
//
//  Created by jose francisco morales on 12/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct TopImage: View {
    let screen = UIScreen.main.bounds
    
    var posterPath: String
   
    
    var body: some View {
        
        KFImage( ImagePath.original.path(poster: posterPath ) )
                                .resizable()
                               
            .frame(width: screen.width,height: screen.height/2)
            .scaledToFit()
                                .clipped()
                              
             
    }
}

struct TopImage_Previews: PreviewProvider {
    static var previews: some View {
        TopImage(posterPath: exampleMovie.poster_pathM)
    }
}
