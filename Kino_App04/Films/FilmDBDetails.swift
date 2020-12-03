//
//  FilmDBDetails.swift
//  Kino_App04
//
//  Created by jose francisco morales on 29/11/2020.
//

import SwiftUI
import CoreData
import KingfisherSwiftUI

struct FilmDBDetails: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    @EnvironmentObject var appData: AppData
    
    let film: Film
     
    @State private var selectedRows: Set<UUID> = []
    
    
    var body: some View {
        
        GeometryReader { proxy in
            HStack {
                KFImage(ImagePath.medium.path(poster: film.backdrop_pathW))
                    .resizable()
                    .frame(width: proxy.size.width/4)
                    .padding(.leading, 3)
                    .onTapGesture(perform: {
                        appData.movieDetailToShow = Int(film.movieId)
                        appData.personDetailToShow = nil
                    })
                
                LazyVStack(spacing: 0)   {
                    ScrollView(.horizontal){
                        HStack{
                     Text(film.titleW).bold()
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                 Text("id: \(film.movieId), year: \(film.year ?? ""), vote: \(film.vote_average)")
                            .font(.caption)
                        }}
                             
                        HStack{ Text("Cast:")
                            ScrollView(.horizontal){
                                Text(film.castW.joined(separator: ", "))
                            }
                        }
                       
                        HStack{ Text("Director:")
                            ScrollView(.horizontal){
                                    Text(film.directorW.joined(separator: ", "))
                            }
                        }
                        
                        HStack{ Text("Genres:")
                                ScrollView(.horizontal){
                                    Text(film.genresW.joined(separator: ", "))
                                    }
                                }
                      
                        HStack{ Text("Keywords:")
                            ScrollView(.horizontal){
                                Text(film.keywordsW.joined(separator: ", "))
                            }
                        }
                        
                        HStack{ Text("Similar:")
                            ScrollView(.horizontal){
                                Text(film.similarW.joined(separator: ", "))
                            }
                        }
                        
                        HStack{ Text("Recommendations:")
                            ScrollView(.horizontal){
                                Text(film.recommendationsW.joined(separator: ", "))
                            }
                        }
                        
                    
                    
                    
                }.font(.caption)
                 
            }
            .foregroundColor(.gray)
            
        }
    }
}

        
    

struct FilmDBDetails_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        
        
        let film = Film(context: moc)
        film.backdrop_path = "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg"
        film.title = "Zelig"
        film.movieId = 100
        
         
      return FilmDBDetails(film: film )
        }
}
