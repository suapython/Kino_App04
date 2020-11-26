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

    
    var body: some View {
       
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack {
                        ForEach(movies){movie in
                            DisplayURLImage(urlPath: movie.poster_path ?? "")
                                .frame(width:100, height: 200)
                                .padding(.horizontal, 0)
                                .onTapGesture(perform: {
                                    appData.movieDetailToShow = movie.id
                                    appData.personDetailToShow = nil
                                })
                            
                        }
                    }
                }
                
            }
            
}
    



struct OtherMoviesStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    RowMovies(movies: [exampleMovie,exampleMovie2] )}}
        }
    }
}
