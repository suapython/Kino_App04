//
//  PopularMovieView.swift
//  NetflixClone
//
//  Created by jose francisco morales on 14/09/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct RowMovieView: View {
    var movie: Movie
    @EnvironmentObject var appData: AppData
    @Environment(\.managedObjectContext) private var moc
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(ImagePath.medium.path(poster: movie.backdrop_pathM))
                    .resizable()
                    .frame(width: proxy.size.width/3)
                    .padding(.leading, 3)
                    .onTapGesture(perform: {
                        appData.movieDetailToShow = movie.movieId
                        appData.personDetailToShow = nil
                    })
                
                LazyVStack(spacing: 0)   {
                HStack{
                    
                    Text(movie.userTitle).bold()
                        .font(.system(size: 14))
                     
                    Text("(\(movie.year))")
                        .font(.system(size: 10))
    
                    Spacer()
                }

                    Button("Save to Data Model") {
                       let newFilm = Film(context: self.moc)
                        newFilm.title = movie.title
                        newFilm.movieId = Int32(movie.movieId)

                        try? self.moc.save()
                        
                    }
                    
                HStack{
                Text(movie.overview)
                .font(.caption)
                    .lineLimit(3)
                    .foregroundColor(.gray)
                    Spacer()
                }
                }
                 
            }
            .foregroundColor(.white)
            
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack { Color.black
            .edgesIgnoringSafeArea(.all)
        
            RowMovieView(movie: exampleMovie)
            .frame(height: 75)
        }
    }
}
