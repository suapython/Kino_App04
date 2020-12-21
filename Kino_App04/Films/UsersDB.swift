//
//  UsersDB.swift
//  Kino_App04
//
//  Created by jose francisco morales on 19/12/2020.
//

import SwiftUI

struct UsersDB: View {
    
    @ObservedObject var vm = UserDBVM()
    @State private var isPresented: Bool = false
    @State var newUser = UserData()
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .center) {
                
                VStack(alignment: .leading){
                    
                    
                    ButtonsDB()
                    
                    Text("user: \(appData.currentUser.nameW)").padding()
                    
                     
                        ForEach(vm.users, id: \.self) { user in
                            
                            NavigationLink(destination: UserDBDetails(vm: UserDBDetailsVM(user: user) )) {
                                
                                HStack{  Text(user.name ?? "")
                                    Spacer()
                                    Text(user.category ?? "")
                                    
                                }.foregroundColor(.white)
                                .padding(.horizontal)
                            }
                            
                        }.onDelete{ index in
                            vm.deleteUser(vm.users[index.first!])}
                        .onMove { indexSet, index in
                            vm.users.move(fromOffsets: indexSet,
                                                toOffset: index)
                        
                    }.navigationBarTitle("Users",  displayMode: .inline)
                        .navigationBarItems(leading:   Button("Add"){self.isPresented = true},
                                            trailing: EditButton() )
                    
                        InputAlert(isShown: $isPresented, newUser: $newUser, onDone: { newUser in
                                    vm.saveUser(newUser)})
                            .environment(\.colorScheme, .light)
                    
                }.environment(\.colorScheme, .dark)
            }
        }
    }
    
}


struct ButtonsDB: View {
    var body: some View {
        HStack{  Button(action: {getCoreDataDBPath()}, label: {Image(systemName: "folder") })
            .accentColor(Color("TertiaryColor"))
            Spacer()
            
            Button( action: {CoreDataManager.shared.deleteAllData(entity: "Film")
                        CoreDataManager.shared.deleteAllData(entity: "Film")}, label:
                            {Image(systemName: "trash")})
                .accentColor(Color("SecondaryColor"))
            
        }.accentColor(Color("TertiaryColor"))
        .padding()
    }
}


struct UsersDB_Previews: PreviewProvider {
    static var previews: some View {
        UsersDB()
    }
}

