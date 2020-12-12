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
        VStack{
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
                                .onLongPressGesture(minimumDuration: 1, pressing: { value in
                                       print("In progress: \(value)!")
                                    movieToDisplay = movie
                                    self.pressing = value
                                   }) {
                                    self.pressing = false
                                    movieToDisplay = emptyMovie
                                   }
                                
                            
                        }
                    }
                }
            if pressing {Text(movieToDisplay.title)}
            }
    }
}
    



struct OtherMoviesStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    RowMovies(movies: [exampleMovie,exampleMovie2] ).environmentObject(AppData()) }}
        }
    }
}
