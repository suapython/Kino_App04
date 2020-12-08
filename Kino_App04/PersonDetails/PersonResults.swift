//
//  searchResults.swift
//  Kino_App02
//
//  Created by jose francisco morales on 02/11/2020.
//

import SwiftUI

struct PersonResults: View {
    
    @ObservedObject var vm: PersonDetailVM
    
    @EnvironmentObject var appData: AppData

    
    
    var body: some View {
        
         
        var movies: [PersonCastItem] =  (vm.person.movie_credits!.crew   + vm.person.movie_credits!.cast  )
                            .filter{$0.poster_path != nil}
                            .sorted(by: { $0.popularityP > $1.popularityP })
                            .removingDuplicates()
            
        
       return
        ScrollView(.vertical,showsIndicators: false) {
                            LazyVStack {
                                ForEach(movies, id: \.self) { movie in
                                    HStack{                DisplayURLImage(urlPath: movie.poster_path ?? "")
                                        .frame(width:100)
                                    .onTapGesture(perform: {
                                        appData.personDetailToShow = nil
                                        appData.movieDetailToShow = movie.movieId
                                    })
                                        LazyVStack(spacing: 0)   {
                                        HStack{
                                            
                                            Text(movie.title).bold()
                                                .font(.system(size: 14))
                                             
                                            Text("(\(movie.year))")
                                                .font(.system(size: 10))
                                            Text("\(movie.popularityP) ")
                                                .font(.system(size: 10))
                                            Spacer()
                                        }

                                        HStack{
                                        Text(movie.overview)
                                        .font(.caption)
                                            .lineLimit(3)
                                            .foregroundColor(.gray)
                                            Spacer()
                                        }
                                        }
                                        
                                    } .frame(height: 75)
                                     
                                    
                                }}
                            
            }
        
        
    }
    
    
}

struct PersonResults_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            PersonResults(vm: PersonDetailVM(personId: 1243)    )
        }.foregroundColor(.white)
    }
}
