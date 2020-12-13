//
//  ListsRowStack.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import SwiftUI

struct RowMovies: View {
    
    var movies: [Movie]
    @EnvironmentObject var appData: AppData
    @State private var pressing: Bool = false
    @State private var movieToDisplay = emptyMovie
    
    var body: some View {
        
         
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 5) {
            
                ForEach(movies) { movie in
                    NavigationLink(
                        destination: MovieDetail(vm: MovieDetailVM(movieId: movie.movieId)) ) {
                        DisplayURLImage(urlPath: movie.poster_pathM ).frame(width:100, height: 200)
                    }  
                }
               
            }
        }
        .frame(height: 200)
                  
    }
}
    



struct OtherMoviesStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
                    RowMovies(movies: [exampleMovie,exampleMovie]).environmentObject(AppData())
        }
    }}
       
