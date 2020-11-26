//
//  SearchView.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchVM()
    @EnvironmentObject var appData: AppData
    
    @State private var queryText = ""
    
    @State var currentTab: TabSearch = .movie
    let tabs: [TabSearch] = [.movie, .person]
    
    
    var body: some View {
        
        var queryTextBinding = Binding {
            return queryText
        } set: {
            queryText = $0
            vm.query = $0
            vm.setViewState(to: .loading)
            print("query:", vm.query)
        }
 
        
        return ZStack {
    
            Color.black
                .edgesIgnoringSafeArea(.all)
            
                    
            VStack(spacing: 10) {
                        
                        DisplayImageView(poster: Image("knhoscope2"), info: Text("")  )
                        .frame(height: 200)
                         
                
                CustomTabView(tabs: tabs, currentTab: $vm.searchFilter, action: {queryText = "" })
                        
                SearchBar(queryText: queryTextBinding, isLoading: $vm.isLoading)
                    .padding()
                        
                SearchResults(vm: vm )
                
                        
                       Spacer()
                       
                }
                 
            
                    
         }
         .foregroundColor(.white)
         
     }
 }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() 
    }
}
