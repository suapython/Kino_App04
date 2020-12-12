//
//  loginForm.swift
//  Kino_App04
//
//  Created by jose francisco morales on 06/12/2020.
//

import SwiftUI
import CoreData

struct LoginForm: View {
    
    @State var userInput = UserData()
    
    let tabs: [TabLogin] = [.users,.add ]
    @State var loginTab: TabLogin = .users

    
    @EnvironmentObject var appData: AppData
    @ObservedObject var vm = LoginFormVM()
    

    var body: some View {
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                CustomTabView(tabs: tabs, currentTab: $loginTab, action: {}  ).padding()
                
                Spacer()
                switch loginTab {
                case .add:
                    VStack{
                        
                        
                        TextField("Name", text: $userInput.name)
                            .padding(7)
                            .background(Color.graySearchBakground)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                        Text("Pick a category")
                        Picker(selection: $userInput.category,
                               label: Text("Category")) {
                            ForEach(Category.allCategories, id: \.self) { category in
                                Text(category).foregroundColor(.white)}
                        }
                        .padding(.horizontal)            .background(RoundedRectangle(cornerRadius: 15)            .stroke(Color.blue, lineWidth: 1))
                        
                        
                        .shadow(radius: 5)
                        .frame(width: 150)
                        
                        
                        
                        
                        Button("Save") {
                            CoreDataManager.shared.saveUser(user: userInput)
                            vm.fetchAllUsers()
                            userInput = UserData()
                        }
                        .padding()
                        .border(Color.blue)
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                case .users:
                    
                    VStack{
                        
                        NavigationView {
                                  
                        List {
                            Section(header: Text("Users").padding()) {
                                 
                                ForEach(vm.users, id: \.self) { user in
                                    
                                    NavigationLink(destination: UserDBDetails(user: user)) {
                                        
                                        HStack{  Text(user.name ?? "")
                                            Spacer()
                                            Text(user.category ?? "")
                                                
                                        }.foregroundColor(.white)
                                        .padding(.horizontal)
                                       
                                        
                                    }
                                    
                                }.onDelete{ index in
                                    CoreDataManager.shared.deleteUser(user: vm.users[index.first!])
                                    print("\(index.first)")
                                    print("\(vm.users[index.first!].name)")
                                    vm.fetchAllUsers()
                                    }
                                
                                    
                                    
                                   
                                
                            }
                            
                            
                            
                        }.environment(\.colorScheme, .dark)
                        .navigationBarItems(trailing: EditButton() )
                           
                        }
                       
                         
                    }
                }
            } 
        }
        
        
    
        
    
     
//    func delete(at indexes: IndexSet) {
//       if let first = indexes.first {
//        vm.users.remove(at: first)
//        vm.deleteUser(vm.users.!)
//       }    }
   
   
   
    }
    
//    func delete(at offsets: IndexSet) {
//        for offset in offsets {
//            CoreDataManager.shared.deleteUser(user: vm.users[offset])
//            print("index \(offset.first)")
//            print("name \(vm.users[offset.first].name)")
//            vm.fetchAllUsers()
//            }
//        }
    
}

struct UserData {
    
    var name: String = ""
    var category: String = ""
    var topTen: [Int] = []
    
    
}

struct Category {
    static let allCategories = [
        "color",
        "user",
        "vip"
    ]
}




enum TabLogin: Tab {
        case add,users
    
    func title() -> String {
        switch self {
        case .add:
            return "Add"
        case .users:
            return "Users"
            
        }
    }
    
}
    
    


struct loginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
