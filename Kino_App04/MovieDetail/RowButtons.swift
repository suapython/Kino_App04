//
//  RowButtons.swift
//  Kino_App04
//
//  Created by jose francisco morales on 06/12/2020.
//

import SwiftUI

struct RowButtons: View {
        
        var movie: Movie
        @EnvironmentObject var appData: AppData
        
        @Binding var showingVideoPlayer: Bool
        @Binding var isOnMyList: Bool
        
        var body: some View {
            
           
            
            
            return
                
            HStack {
                Spacer()
                SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn:  isOnMyList){
                    if isOnMyList {
                        //appData.myList = appData.myList.filter { $0 != movie }
                        CoreDataManager.shared.deleteFilm(title: movie.title, user: appData.currentUser)
                        
                        isOnMyList.toggle()
                    }
                    else {
                        CoreDataManager.shared.saveFilm(movie: movie, user: appData.currentUser)
                        
                        isOnMyList.toggle()
                    }}
                Spacer()
                
                PlayButton(text: "Tailer", imageName: "play.fill", backgroundColor: .red) {
                    appData.showingVideoPlayer = true
                    
                    
                    print("playing")
                }.padding()
                
                Spacer()
                
                PopularityBadge(score:  movie.vote_average , textColor: .white, nvotes: movie.vote_count)
                
                Spacer()
                
            }
        }
    }


struct RowButtons_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            RowButtons(movie: exampleMovie, showingVideoPlayer: .constant(false), isOnMyList: .constant(false))
        }
    }
}
