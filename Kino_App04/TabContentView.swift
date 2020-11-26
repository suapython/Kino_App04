//
//  TabContentView.swift
//  NetflixClone
//
//  Created by jose francisco morales on 13/09/2020.
//

import SwiftUI


 


struct TabContentView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State var selectedTab =  0
    
    
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
            FilmsView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
             
        }
        .accentColor(.white)
        
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
    }
}
