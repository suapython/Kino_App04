//
//  SearchVM.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import Foundation
import SwiftUI
import Combine

class SearchVM: ObservableObject {
    
   // @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = ViewState.standby
    
    
    @Published var query: String = ""
    @Published var searchFilter: TabSearch = .movie
    
    @Published var movies: [Movie] = []
    @Published var people: [Person] = []
    
    
    
    private var disposables = Set<AnyCancellable>()
    
    
    
    init() {
        $query
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink(receiveValue: {value in switch self.searchFilter {
                  case .movie:
                    self.getMovie(query: value)
                  case .person:
                    self.getPerson(query: value)
            } } )
            .store(in: &disposables)
        
        
    }
    
    
   
        
    
}


extension SearchVM {
    
    
    
    func getMovie(query: String) {
        let urlComponents = APIClient().makeURLComponents(path: "search/movie", queries:  ["query": query])
        print(urlComponents.url)
        APIClient().fetchMovie(with: urlComponents)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure:
                    self.movies = []
                    self.setViewState(to: .error)
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] value in
                guard let self = self else { return  }
                self.movies = value.movies.filter {$0.poster_path != nil}
                self.movies.count > 0 ? self.setViewState(to: .ready) : self.setViewState(to: .empty)
                 
            })
            .store(in: &disposables)
        
    }
    
    func getPerson(query: String) {
        let urlComponents = APIClient().makeURLComponents(path: "search/person", queries:  ["query": query])
        APIClient().fetchPerson(with: urlComponents)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error): print("Error \(error)")
                    print("failure")
                    self.setViewState(to: .error)
                    print(error)
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] value in
                guard let self = self else { return  }
                self.people = value.people.filter {$0.profile_path != nil}
                self.people.count > 0 ? self.setViewState(to: .ready) : self.setViewState(to: .empty)
                print("value",value)
            })
            .store(in: &disposables)
        
    }
    
    
    
    
        
        public func setViewState(to state: ViewState) {
            DispatchQueue.main.async {
                self.viewState = state
              //  self.isLoading = state == .loading
            }
        }
        
    
    
}


enum ViewState {
    case standby
    case empty
    case loading
    case ready
    case error
}
