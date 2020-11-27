//
//  MovieList.swift
//  Kino_App02
//
//  Created by jose francisco morales on 30/10/2020.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var vm = MovieListVM()
    @EnvironmentObject var appData: AppData
    @State var currentTab: TabCategory = .popular
    
    var tabs: [TabCategory] = [.popular, .topRated,.trending, .upcoming, .nowPlaying ]
    
    let screen = UIScreen.main.bounds
     
     
//
    var body: some View {
        
        let movieTop = vm.movies[.nowPlaying]?.shuffled()[0] ??  emptyMovie
        
        
        
        
        return
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
            
                ScrollView(showsIndicators: false) {
                    LazyVStack{
                         
                            DisplayImageView(poster: Image("knhoscope2"), info: Text("")  )
                                .frame(height: screen.height/3)
                            
                            CustomTabView(tabs: tabs, currentTab: $currentTab, action: {}).padding()
                         
                            RowMovies(movies: vm.movies[currentTab] ?? [])
                       
 
                    }
                }.foregroundColor(.white)
                    
                     
                        
                if appData.movieDetailToShow != nil {
                    MovieDetail(vm: MovieDetailVM(movieId: appData.movieDetailToShow!) )
                                .animation(.easeIn)
                                .transition(.opacity)
                        }
                
                if appData.personDetailToShow != nil {
                    PersonDetail(vm: PersonDetailVM(personId: appData.personDetailToShow!))
                        .animation(.easeIn)
                        .transition(.opacity)
                    }
                
                
                }
            
    }
}


struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList().environmentObject(AppData())
    }
}
