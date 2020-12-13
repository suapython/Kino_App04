//
//  PersonDetail.swift
//  Kino_App02
//
//  Created by jose francisco morales on 27/10/2020.
//

import SwiftUI

struct PersonDetail: View {
    
    @ObservedObject var vm: PersonDetailVM
    
    @EnvironmentObject var appData: AppData

 
    let screen = UIScreen.main.bounds
    
    var body: some View {
    
        NavigationView {
            ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
                
            VStack(alignment: .leading){
            
                
            Image("knhoscope2")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(height: screen.height/3)
                    .edgesIgnoringSafeArea(.all)
                
                
    
            RowPersonView(person: vm.person)
                            .frame(height:150)

            Text("Filmography").bold()
                            .font(.subheadline)
                            .frame(width:screen.width)
                            .padding(10)
                            .background(Color.red)
                        
            PersonResults(vm: vm )
                    
            Spacer()
                    
                   
               }
            }
        }.onAppear {
            UINavigationBar.appearance().backgroundColor = .clear
        }
   }
    
}
    
 
    
    

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(vm: PersonDetailVM(personId: 1243) )
    }
}
