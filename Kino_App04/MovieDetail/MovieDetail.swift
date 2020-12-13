//
//  MovieDetail.swift
//  Kino_App02
//
//  Created by jose francisco morales on 26/10/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieDetail: View {
    
    @ObservedObject var vm: MovieDetailVM
    @EnvironmentObject var appData: AppData
    @State private var showingVideoPlayer = false
    @State var movieTab: TabMovieData = .cast
    
    let tabs: [TabMovieData] = [.cast,.recommend,.similar]
    let screen = UIScreen.main.bounds

    var body: some View {
        
        let movie = vm.movie
        
       return
        NavigationView {
           
            ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
               
                VStack{
                
                  
                    
                    ZStack{
                        TopImage(posterPath: movie.poster_pathM).frame(height: 100)
                            .padding(.bottom,50)
                    VStack {
                    Spacer()
                    TitleInfo(movie: vm.movie)

                    RowButtons(movie: vm.movie, showingVideoPlayer: $showingVideoPlayer, isOnMyList: $vm.isOnMyList)

                    CastInfo(movie: vm.movie)
                        }
                    .background(LinearGradient.blackOpacityGradient)
                    .background(LinearGradient.blackOpacityGradientUp)
                   .ignoresSafeArea(.all)
                    
                    
                    
                    }
                        
                    
                   CustomTabView(tabs: tabs, currentTab: $movieTab, action: {}  ).padding()
                     
                
                    switch movieTab {
                    case .cast:
                    RowCast(vm: vm  )
                    case .recommend:
                    RowMovies(movies: vm.movie.recommendationsM.movies  )
                    case .similar:
                    RowMovies(movies: vm.movie.similarM.movies )
                                }
                        
                  
                    
                }.sheet(isPresented: $appData.showingVideoPlayer, content: {
                                        TrailerView(videos: vm.movie.videosV ) })
                                            .ignoresSafeArea(.all)
            
            }.navigationBarTitle(Text(vm.movie.title))
                .navigationBarHidden(true)
        
            }.onAppear {
                UINavigationBar.appearance().backgroundColor = .clear
            }
        .padding(.bottom,20)
    }
}

 
 

struct TitleInfo: View {
    
    var movie: Movie
    let bluecircle: some View =  Image(systemName: "circle.fill")
        .foregroundColor(.blue)
        .font(.system(size: 3))
    
    var body: some View {
        LazyVStack(spacing: 0)   {
            
            HStack{
                
                Text(movie.userTitle).bold()
                    .font(.system(size: 18))
                bluecircle
                Text("\(movie.year)")
                    .font(.system(size: 14))
                if  movie.MPAA != nil {
                    bluecircle
                    Text("\(movie.MPAA!)").font(.system(size: 14))}
                
                if  movie.runtimeM != nil {
                    bluecircle
                    Text("\(movie.runtimeM!)")
                        .font(.system(size: 14))}
                Spacer()
            }.lineLimit(1)
            
            HStack{
                Text(movie.overview)
                    .font(.caption)
                    .lineLimit(2)
                Spacer()
            }
        }
    }
}


struct CastInfo: View {
    
    var movie: Movie
    
    var body: some View {
         VStack(spacing: 0)   {
            HStack{ Text("Cast:")
                ScrollView(.horizontal){
                    Text(movie.cast.map{$0.name}.joined(separator: ", "))
                }
            } .foregroundColor(.gray)
            
            HStack{ Text("Director:")
                ScrollView(.horizontal){
                    Text(movie.directors.map{$0.name}.joined(separator: ", "))
                }
            }.foregroundColor(.gray)
            
            HStack{ Text("Genres:")
                ScrollView(.horizontal){
                    Text(movie.genresM.map{$0.name}.joined(separator: ", "))
                }}
            
            HStack{ Text("Keywords:")
                ScrollView(.horizontal){
                    Text(movie.keywordsM.map{$0.name}.joined(separator: ", "))
                }
            }
            
            
        }
        .font(.caption)
        
    }
}




struct MovieDetail_Previews: PreviewProvider {
   static var previews: some View {
    MovieDetail(vm: MovieDetailVM(movieId: exampleMovie.movieId) ).environmentObject(AppData())
        .environment(\.colorScheme, .dark)
   }
}
