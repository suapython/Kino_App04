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
        
        VStack {
        
        Text("\(film.title ?? "")")
            .font(.largeTitle)
            Text("id: \(film.movieId), year: \(film.year ?? ""), vote: \(film.vote_average)")
                .font(.caption)
                .foregroundColor(.secondary)
        
            
            
//            ForEach(film.cast) { item in
//                Text("\(item.name)"
//                 }
//
           
            
            
        
        }
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
