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

 
    var body: some View {
        
        let movieTop = vm.movies[.nowPlaying]?.shuffled()[0] ??  emptyMovie
    
        return
            NavigationView {
                ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading){
                        
             Image("knhoscope2")
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(height: screen.height/3)
                                .edgesIgnoringSafeArea(.all)
                        
               CustomTabView(tabs: tabs, currentTab: $currentTab, action: {}).padding(.leading, 90)
               RowMovies(movies: vm.movies[currentTab] ?? []).padding(.leading, 90)
                        Spacer()
                    }
        
                    }.navigationBarTitle(Text("Movies"))
                    .navigationBarHidden(true)
                }.onAppear {
                    UINavigationBar.appearance().backgroundColor = .clear
                        
                }
               
                   
    }
    
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList().environmentObject(AppData())
            .environment(\.colorScheme, .dark)
    }
}
