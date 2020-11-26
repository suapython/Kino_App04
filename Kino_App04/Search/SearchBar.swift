//
//  SearchBar.swift
//  NetflixClone
//
//  Created by jose francisco morales on 13/09/2020.
//

import SwiftUI

struct SearchBar: View {
    
    @ObservedObject var vm = SearchVM()
    @Binding var queryText: String
    
    @State private var isEditing: Bool = false
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack{
        ZStack(alignment: .leading) {
            Color.graySearchBakground
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $queryText)
                    .padding(7)
                    .padding(.leading, -7)
                    .background(Color.graySearchBakground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                
                if !queryText.isEmpty {
                Button(action: {
                    queryText = ""
                    vm.setViewState(to: .standby)
                }, label: {
                    if isLoading {
                        ActivityIndicatorView()
                    } else
                    {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                       // .frame(width: 35, height: 35)
                    }
                }).frame(width: 35, height: 35)
                .padding(.trailing, 8)
            }
            }
        }.frame(height: 36, alignment: .leading)
       
      
            
            if isEditing {
                Button(action: {
                    queryText = ""
                    isEditing = false
                    hideKeyboard()
                    vm.setViewState(to: .standby)
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
            
        }
        
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
        SearchBar(queryText: .constant(""), isLoading: .constant(false))
            .padding()
        }
    }
}
