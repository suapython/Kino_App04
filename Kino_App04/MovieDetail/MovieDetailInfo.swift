//
//  GenreInfo.swift
//  Kino_App02
//
//  Created by jose francisco morales on 13/11/2020.
//

import SwiftUI

struct MovieDetailInfo: View {
    var movie: Movie
    @EnvironmentObject var appData: AppData
    
    let bluecircle: some View =  Image(systemName: "circle.fill")
        .foregroundColor(.blue)
        .font(.system(size: 3))
    
    @State private var showingVideoPlayer = false
     
    
    
    var body: some View {
        
       var isOnMyList =  appData.myList.contains(movie)
       
        return
            
        LazyVStack(spacing:10 ){
            
           
            LazyVStack(spacing: 5)   {
                 
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
            HStack {
                Spacer()
            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                appData.showingVideoPlayer = true
                print("playing")
            }
            
            
            Spacer()
                
                SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn:  isOnMyList){
                    if isOnMyList {
                        appData.myList = appData.myList.filter { $0 != movie }
                        isOnMyList.toggle()
                    }
                    else {
                        appData.myList.append(movie)
                        isOnMyList.toggle()
                    }
                    print("mylist", appData.myList.count)
                    
            }
                Spacer()
            }
            
            
            
            
            
            LazyVStack(spacing: 0)   {
                HStack{ Text("Cast:")
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(movie.cast) {cast in
                                Text("\(cast.name) ")}
                        }
                    }
                } .foregroundColor(.gray)
                
                HStack{ Text("Director:")
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(movie.directors) {director in
                                Text("\(director.name)") }
                        }
                    }
                }.foregroundColor(.gray)
                
                HStack{ Text("Genres:")
                        ScrollView(.horizontal){ HStack {
                            ForEach(movie.genresM) {genre in
                                Text("\(genre.name) ")
                            }}
                        }}
              
                HStack{ Text("Keywords:")
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(movie.keywordsM, id: \.self) {keyword in
                                Text("\(keyword.name) ")}
                        }
                    }
                } 
                
                
            }
            .font(.caption)
           
           
            
            
        
    }
        .foregroundColor(.white)
    }
    
}

struct MovieDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack { Color.black
            .edgesIgnoringSafeArea(.all)
            MovieDetailInfo(movie: exampleMovie)
        }
    }
}
