//
//  ContentView.swift
//  Kino_App04
//
//  Created by jose francisco morales on 26/11/2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Film.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Film.title, ascending: true)
       //, NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var films: FetchedResults<Film>
    
    @State private var showingAddScreen = false
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(films, id: \.self) { film in
                    NavigationLink(destination: DetailView(film: film)){
                         

                        VStack(alignment: .leading) {
                            Text(film.title ?? "Unknown Title")
                                .font(.headline)
                            Text("\(film.movieId ?? 0)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteFilms)
            }
            .navigationBarTitle("Films")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                       self.showingAddScreen.toggle()
                   }) {
                       Image(systemName: "plus")
                   })
                       .sheet(isPresented: $showingAddScreen) {
                           AddView().environment(\.managedObjectContext, self.moc)
                   }
                
        } 
       
    }
    
    func deleteFilms(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let film = films[offset]

            // delete it from the context
            moc.delete(film)
        }

        // save the context
        try? moc.save()
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
