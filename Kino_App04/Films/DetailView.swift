//
//  BookDetailsView.swift
//  BookWorm
//
//  Created by jose francisco morales on 29/02/2020.
//  Copyright © 2020 jose francisco morales. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    let film: Film
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text(self.film.title ?? "Unknown Title")
                    .font(.title)
                    .foregroundColor(.secondary)

                Text("\(self.film.movieId ?? 0)")
                    .padding()
 

                Spacer()
            }
        }
        .navigationBarTitle(Text(film.title ?? "Unknown Title"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete film"), message: Text("Are you sure"),
                  primaryButton: .destructive(Text("Delete")) {
                    self.deleteFilm()
                }, secondaryButton: .cancel()
            )
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
    }
    
    func deleteFilm() {
        moc.delete(film)

        // uncomment this line if you want to make the deletion permanent
        // try? self.moc.save()
        presentationMode.wrappedValue.dismiss()
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let film = Film(context: moc)
        film.title = "Test film"
        film.movieId = 0
        

        return NavigationView {
            DetailView(film: film)
        }
    }
}
