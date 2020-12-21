//
//  FilmDBDetails.swift
//  Kino_App04
//
//  Created by jose francisco morales on 29/11/2020.
//

import SwiftUI
import CoreData
import KingfisherSwiftUI

struct UserDBDetails: View {
    
     
    @EnvironmentObject var appData: AppData
    

    @ObservedObject var vm: UserDBDetailsVM

    
    var body: some View {

        

        return
       
        ZStack {
           Color.black
               .edgesIgnoringSafeArea(.all)

            VStack{
                HStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: 30)

                    VStack(alignment: .leading, spacing:0){
                        Text(vm.user.nameW).bold()
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        Text(vm.user.categoryW)
                            .font(.caption)
                            .foregroundColor(.gray)
                            }
                         Spacer()
                    Button(action:  {appData.currentUser = vm.user}
                           , label: {Text("Login").bold().padding()
                            .foregroundColor(appData.currentUser == vm.user ? Color.gray : Color.blue)
                           })
                        .disabled(appData.currentUser == vm.user)

                        }
                
                    List {
                        ForEach(vm.films.indices, id: \.self) { index in
                            let film = vm.films[index]
                               HStack{
                            Text("\(index+1)")
                                FilmDBDetails(film: film).frame(height: 100)     }

                        }
                        .onMove { indexSet, index in
                            vm.films.move(fromOffsets: indexSet,
                                                toOffset: index)
                        }.onDelete { set in
                            vm.films.remove(atOffsets: set)
                        }

                    }
            }.navigationBarTitle(vm.user.nameW)
                    .navigationBarItems(trailing: EditButton().foregroundColor(.blue))
                    }
               
        
    }

    


}






    

struct UserDBDetails_Previews: PreviewProvider {
    
    
    static var previews: some View {
            
        var exampleUser = User(context: managedObjectContext)
        exampleUser.name = "Red"
        exampleUser.category = "Color"
        
        return
            
            UserDBDetails(vm: UserDBDetailsVM(user: exampleUser) )
            .environment(\.colorScheme, .dark)
        }
}

 
 
