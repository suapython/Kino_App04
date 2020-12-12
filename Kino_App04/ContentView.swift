//
//  ContentView.swift
//  Kino_App04
//
//  Created by jose francisco morales on 26/11/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appData = AppData()
    
    var body: some View {
        
        //FilmsDB()
      TabContentView().environmentObject(appData)
       // MovieDetail(vm: MovieDetailVM(movie: exampleMovieRowVM1), movieDetailToShow: .constant(nil))
       // PersonDetail(vm: PersonDetailVM(personId: 1243), movieDetailToShow: .constant(nil), personDetailToShow: .constant(nil))
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .environment(\.colorScheme, .light)

         ContentView()
            .environment(\.colorScheme, .dark)
      }
   }
}
#endif
