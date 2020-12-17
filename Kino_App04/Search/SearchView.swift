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
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        var queryTextBinding = Binding {
            return queryText
        } set: {
            queryText = $0
            vm.query = $0
            vm.setViewState(to: .loading)
            //print("query:", vm.query)
        }
 
        
        return
            
            NavigationView {
                ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading, spacing: 10){
            
            
               HeaderView()
                         
                
                CustomTabView(tabs: tabs, currentTab: $vm.searchFilter, action: {queryText = "" })
                        
                SearchBar(queryText: queryTextBinding)
                          //, isLoading: $vm.isLoading)
                    
                        
                SearchResults(vm: vm )
                
                        
                       Spacer()
                
            }.navigationBarTitle(Text("Search"))
            .navigationBarHidden(true)
        }.onAppear {
            UINavigationBar.appearance().backgroundColor = .clear
                
        }
                
                
                
                
            }.onAppear {
                UINavigationBar.appearance().backgroundColor = .clear
                    
            }
     }
 }


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
                    VStack(spacing: 5) {
                        ForEach(vm.movies) { movie in
                            NavigationLink(destination:MovieDetail(vm: MovieDetailVM(movieId: movie.movieId)))
                    
                            {
                            RowMovieView(movie: movie) .frame(height: 75)
                            }
                        }
                    }
                }
                
            } else {
                 
                    ScrollView(.vertical,showsIndicators: false) {
                        VStack(spacing: 5) {
                            ForEach(vm.people) { person in
                                
                                NavigationLink(
                                    destination: PersonDetail(vm: PersonDetailVM(personId: person.personId)) ) {
                        
                                RowPersonView(person: person)     .frame(height: 75)
                                }
                        }
                    }
                    
                }
            }
            
        }
    }
}

 







struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(AppData())
    }
}
