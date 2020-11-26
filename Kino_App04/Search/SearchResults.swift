//
//  searchResults.swift
//  Kino_App02
//
//  Created by jose francisco morales on 02/11/2020.
//

import SwiftUI

struct SearchResults: View {
    
    @ObservedObject var vm: SearchVM
    
    @EnvironmentObject var appData: AppData
    
  
    
    var body: some View {
        
        VStack{
            
            if vm.viewState == .empty {
                Text("Your search did not have any results")
                    .bold()
                    .padding(.top, 150)
            } else if vm.searchFilter == .movie {
                ScrollView(.vertical,showsIndicators: false) {
                    LazyVStack {
                        ForEach(vm.movies) { movie in
                            
                            RowMovieView(movie: movie) .frame(height: 75)
                        }
                    }
                }
                
            } else {
                 
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVStack {
                            ForEach(vm.people) { person in
                                
                                RowPersonView(person: person)     .frame(height: 75)
                        }
                    }
                    
                }
            }
            
        }
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            SearchResults(vm: SearchVM()  )
        }
    }
}
