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
    
       
            ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
                
            VStack(alignment: .leading){
            
                Image("knhoscope2")
                                .resizable()
                               .scaledToFill()
                    .frame(width: screen.width)
                    .edgesIgnoringSafeArea(.all)
           
                
                RowPersonView(person: vm.person)
             
            Text("Filmography").bold()
                            .font(.subheadline)
                            .frame(width:screen.width)
                            //.padding(10)
                            .background(Color.red)
                        
            PersonResults(vm: vm )
                    
          Spacer()
                   
               }
        
       
        }.onAppear {
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().backgroundColor = .clear
        }
   }
    
}
    
 
    
    

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(vm: PersonDetailVM(personId: 1243) )
    }
}
