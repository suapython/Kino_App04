//
//  StandardHomeMovie.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import SwiftUI
import KingfisherSwiftUI


struct DisplayURLImage: View {
    var urlPath: String
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(ImagePath.original.path(poster: urlPath ?? noimage))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        DisplayURLImage(urlPath: exampleMovie.poster_pathM)
    }
}
