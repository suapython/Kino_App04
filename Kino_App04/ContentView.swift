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
        
       //UsersDB()
       TabContentView().environmentObject(appData).environment(\.colorScheme, .dark)
        
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
