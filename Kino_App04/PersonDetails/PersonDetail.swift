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
        VStack{
            
            ZStack{
         
                CloseButton2()
                    .zIndex(1)
                    .padding(.trailing,10)
                    .padding(.top,-20)
        DisplayImageView(poster: Image("knhoscope2"), info: Text("")  )
        .frame(height: 150)
            .padding(.top,25)
        
       
                
            }.edgesIgnoringSafeArea(.all)
       
        
               ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing:10){
 
                        RowPersonView(person: vm.person)
                            .frame(height:150)

//                                        HStack{
//                        DisplayURLImage(urlPath: vm.person.profile_pathP).frame(width: 100, height:150)
//                        .onTapGesture(perform: {
//                            appData.personDetailToShow = vm.person.personId
//                        })
//                        VStack(alignment: .leading, spacing:0){
//                            Text(vm.person.name).bold()
//                                .font(.system(size: 18))
//                            Text(vm.person.job)
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                            Text(vm.person.biography ?? "").font(.caption)
//                                .lineLimit(4)
//                        }
//                        Spacer()
//                    }
                    
                    VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                        Text("Filmography").bold()
                            .font(.subheadline)
                            .frame(width:screen.width)
                            .padding(10)
                            .background(Color.red)
                            
                           
                    }
                    
                    PersonResults(vm: vm )
                    
                    
                    
                   }
               }
           Spacer()
           }
       }.foregroundColor(.white)
     
   }
    
}
    
struct CloseButton2: View {
    
    @EnvironmentObject var appData: AppData

    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                appData.personDetailToShow = nil
            }, label: { Image(systemName: "xmark.circle")
                .font(.system(size: 28))
            })
        }
    }
}

    
    

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(vm: PersonDetailVM(personId: 1243) )
    }
}
