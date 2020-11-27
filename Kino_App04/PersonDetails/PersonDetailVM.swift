//
//  MovieVM.swift
//  Kino_App02
//
//  Created by jose francisco morales on 23/09/2020.
//

import Foundation
import Combine

class PersonDetailVM: ObservableObject, Identifiable  {
    
    var id = UUID()
    var personId: Int
    
    @Published var person = emptyPerson
    
    
    private var disposables = Set<AnyCancellable>()
     
    init(personId: Int) {
        self.personId = personId
        getPersonDetails(personId: personId)
         
        
    }
    
}

extension PersonDetailVM {
   
    
    func getPersonDetails(personId: Int) {
        let urlComponents = APIClient().makeURLComponents(path: "person/\(String(personId))" , queries: ["append_to_response": "movie_credits" ])
        print("url components persondetail", urlComponents.url  )
        APIClient().fetchPersonDetails(with: urlComponents)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error): print("Error \(error)")
                    print("failure")
                case .finished:
                  break
                }
              },
              receiveValue: { [weak self] value in
                guard let self = self else { return  }
                self.person = value
                
                 
                
    
            })
           .store(in: &disposables)
    }
    
    
    
}

