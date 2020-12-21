//
//  TabContentView.swift
//  NetflixClone
//
//  Created by jose francisco morales on 13/09/2020.
//

import SwiftUI


 


struct TabContentView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State var selectedTab =  2
    
    
   
    
    var body: some View {
        
        let binding = Binding {  
            return selectedTab
        } set: { selectedTab = $0
            appData.movieDetailToShow = nil
            appData.personDetailToShow = nil
        }
        
        return
        
        TabView(selection: binding) {
            MovieList()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            UsersDB()
                .tabItem {
                    Image(systemName: "film")
                    Text("Data")
                }.tag(2)
            
            
             
        }
        //.accentColor(.blue)
        
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
    }
}
