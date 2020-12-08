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
    
    let tabs: [TabMovieData] = [.cast, .recommend, .similar]
    @State var movieTab: TabMovieData = .cast
    let screen = UIScreen.main.bounds
    
    @State private var showingVideoPlayer = false
    @State var showAlert: Bool = false
    @State var textString: String = ""

    
    var body: some View {
        
        let movie = vm.movie
         
        
       return
        
         ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
         
            ZStack {
                VStack {
            
            CloseButton()
                
                    
                 ScrollView(.vertical, showsIndicators: false) {
                    
                         VStack{
                                ZStack{
//                                    
//                                  
//            KFImage( ImagePath.original.path(poster: movie.poster_path ?? noimage ) )
//                                        .resizable()
//                                        .scaledToFill()
//                                        .clipped()
//                                        .frame(width: screen.width)
//                    .padding(.top,-20)
//                                    
//                                    VStack {
//                                        Spacer()
//                                        
//            TitleInfo(movie: vm.movie)
//                                        
                                    RowButtons(movie: vm.movie, showingVideoPlayer: $showingVideoPlayer, showAlert: $showAlert, textString: $textString, isOnMyList: $vm.isOnMyList)
//                                        
//            CastInfo(movie: vm.movie)
  //                          }.foregroundColor(.white)
                            .background(LinearGradient.blackOpacityGradient)
                            .background(LinearGradient.blackOpacityGradientUp)
                            }}
                            .foregroundColor(.white)
                            Spacer()
                            
                        
            CustomTabView(tabs: tabs, currentTab: $movieTab, action: {}  ).padding()
                             
            switch movieTab {
                case .cast:
                RowCast(vm: vm  )
                case .recommend:
                RowMovies(movies: vm.movie.recommendationsM.movies  )
                case .similar:
                RowMovies(movies: vm.movie.similarM.movies )
                             }
                            
            if self.showAlert {
            AlertView( title: "User",message: "Save to DB",isShown: .constant(true), text: $textString, onDone:
                { text in
                appData.myList.append(movie)
                 CoreDataManager.shared.saveFilm(movie: movie, userName: text)
                    vm.isOnMyList.toggle()
                    showAlert = false
                    print("isOnMyLIst \(vm.isOnMyList)")
                    })
            }
                    
                    
                             
                         }.padding(5)
                     }
                 Spacer()
                 
                
    
                
             }
            .sheet(isPresented: $appData.showingVideoPlayer, content: {
                TrailerView(videos: vm.movie.videosV )      })
          
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
        LazyVStack(spacing: 0)   {
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
       MovieDetail(vm: MovieDetailVM(movieId: 11030) ).environmentObject(AppData())
   }
}
