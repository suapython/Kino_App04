//
//  ContentView.swift
//  Kino_App04
//
//  Created by jose francisco morales on 26/11/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appData = AppData()
    
//    init() {
//    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//        // Sets shadow (line below the bar) to a blank image
//        UINavigationBar.appearance().shadowImage = UIImage()
//        // Sets the translucent background color
//        UINavigationBar.appearance().backgroundColor = .clear
//        // Set translucent. (Default value is already true, so this can be removed if desired.)
//        UINavigationBar.appearance().isTranslucent = true
//         
//}
    
    
    var body: some View {
        
        //FilmsDB()
     //   MovieList().environmentObject(AppData())
      TabContentView().environmentObject(appData).environment(\.colorScheme, .dark)
       // PersonDetail(vm: PersonDetailVM(personId: 1243) )
       // MovieDetail(vm: MovieDetailVM(movie: exampleMovieRowVM1), movieDetailToShow: .constant(nil))
       // PersonDetail(vm: PersonDetailVM(personId: 1243), movieDetailToShow: .constant(nil), personDetailToShow: .constant(nil))
        
    }
}

 
#if DEBUG
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         ContentView()
            .environment(\.colorScheme, .dark)
      }
   }
}
#endif
