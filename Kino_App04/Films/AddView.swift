//
//  AddBookView.swift
//  CoreData_Books
//
//  Created by jose francisco morales on 29/08/2020.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @State private var title = ""
    @State private var input = ""
     
    
   
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title of the Movie", text: $title)
                    
                    TextField("id", text: $input)
                }
                
               
                Section {
                    Button("Save") {
                       let newFilm = Film(context: self.moc)
                        newFilm.title = self.title
                        newFilm.movieId = Int32(self.input) ?? 0
                         
                        
                        try? self.moc.save()
                        self.title = ""
                        self.input = ""
                         
                        
                    }
                }
                
            }.navigationBarTitle("Add a Movie")
        }
         
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
