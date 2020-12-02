//
//  FilmDBDetails.swift
//  Kino_App04
//
//  Created by jose francisco morales on 29/11/2020.
//

import SwiftUI
import CoreData

struct FilmDBDetails: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
     
    
    let film: Film
     
    @State private var selectedRows: Set<UUID> = []
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
        
        Text("\(film.title ?? "")")
            .font(.largeTitle)
            Text("id: \(film.movieId), year: \(film.year ?? ""), vote: \(film.vote_average)")
                .font(.caption)
                 
        
            
            HStack{ Text("Cast:")
                ScrollView(.horizontal){
                    Text(film.castArray!.joined(separator: ", "))
                }
            }  
           
            HStack{ Text("Director:")
                ScrollView(.horizontal){
                    HStack{
                        ForEach(film.directorW) {director in
                            Text("\(director.nameW)") }
                    }
                }
            }
            
            HStack{ Text("Genres:")
                    ScrollView(.horizontal){ HStack {
                        ForEach(film.genreW) {genre in
                            Text("\(genre.nameW) ")
                        }}
                    }}
          
            HStack{ Text("Keywords:")
                ScrollView(.horizontal){
                    HStack {
                        ForEach(film.keywordsW, id: \.self) {keyword in
                            Text("\(keyword.nameW) ")}
                    }
                }
            }
            
            HStack{ Text("Similar:")
                ScrollView(.horizontal){
                    HStack {
                        ForEach(film.similarW, id: \.self) {film in
                            Text("\(film.titleW) ")}
                    }
                }
            }
            
            HStack{ Text("Recommendations:")
                ScrollView(.horizontal){
                    HStack {
                        ForEach(film.recommendationsW, id: \.self) {film in
                            Text("\(film.titleW) ")}
                    }
                }
            }
            
            
        
        }.font(.caption)
    }
}

struct FilmDBDetails_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let film = Film(context: moc)
        film.title = "Zelig"
        film.movieId = 100
        
         
      return FilmDBDetails(film: film )
        }
}
