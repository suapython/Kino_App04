//
//  MovieDetail.swift
//  Kino_App02
//
//  Created by jose francisco morales on 26/10/2020.
//

import SwiftUI

struct MovieDetail: View {
    
    @ObservedObject var vm: MovieDetailVM
   
    @EnvironmentObject var appData: AppData
   
    
    let tabs: [TabMovieData] = [.cast, .recommend, .similar]
    
    @State var movieTab: TabMovieData = .cast
    
    let screen = UIScreen.main.bounds
    
    
    
    var body: some View {
       
         ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
         
            ZStack {
                VStack {
                 CloseButton()
                 
                 ScrollView(.vertical, showsIndicators: false) {
                         VStack{
                 DisplayPosterView(poster: vm.movie.poster_path ?? noimage,  view: MovieDetailInfo(movie: vm.movie))
                                 .frame(width: screen.width)
                                 .padding(.top,-70)
                             
                            CustomTabView(tabs: tabs, currentTab: $movieTab, action: {}  ).padding()
                             
                 switch movieTab {
                 case .cast:
                     RowCast(vm: vm  )
                 case .recommend:
                     RowMovies(movies: vm.movie.recommendationsM.movies  )
                 case .similar:
                     RowMovies(movies: vm.movie.similarM.movies )
                             }
                            
                             
                         }.padding(5)
                     }
                 Spacer()
                 }
             }
            .sheet(isPresented: $appData.showingVideoPlayer, content: {
                TrailerView(videos: vm.movie.videosV )

            })
          
        }.foregroundColor(.white)
         
    }
}

struct CloseButton: View {
    
    @EnvironmentObject var appData: AppData

    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                appData.movieDetailToShow = nil
            }, label: { Image(systemName: "xmark.circle")
                .font(.system(size: 28))
            })
        }.padding(.horizontal, 22)
    }
}

 
 

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(vm: MovieDetailVM(movieId: 11030) ).environmentObject(AppData())
    }
}
