//
//  TabContentView.swift
//  NetflixClone
//
//  Created by jose francisco morales on 13/09/2020.
//

import SwiftUI


 


struct TabContentView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State var selectedTab =  3
    
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
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
            MyList()
                .tabItem {
                    Image(systemName: "equal")
                    Text("My List")
                }.tag(2)
            FilmsView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Data")
                }.tag(3)
            
            
             
        }
        .accentColor(.white)
        
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
    }
}
