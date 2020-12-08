//
//  loginForm.swift
//  Kino_App04
//
//  Created by jose francisco morales on 06/12/2020.
//

import SwiftUI
import CoreData

struct LoginForm: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \User.name, ascending: true) ]) var users: FetchedResults<User>
    
    
    @State var userInput = UserData()
    
    let tabs: [TabLogin] = [.add, .remove]
    @State var loginTab: TabLogin = .remove

    
    @EnvironmentObject var appData: AppData
    
   
    @State var selection = Set<User>()
    @State var editMode = EditMode.inactive
     
    
    var body: some View {
        
         
        
        return
        
        ZStack {
           Color.black
               .edgesIgnoringSafeArea(.all)
        
        
        VStack{
        
        CustomTabView(tabs: tabs, currentTab: $loginTab, action: {}  ).padding()
             
        Spacer()
        switch loginTab {
            case .add:
                VStack{
                NavigationView {
                   
                            Form {
                          TextField("Name", text: $userInput.name)
                                
                          Picker(selection: $userInput.category,
                                       label: Text("Category")) {
                                        ForEach(Category.allCategories, id: \.self) { category in
                                            Text(category).tag(category)
                                        }
                                }
                                
                                
                                
                            }.navigationBarTitle(Text("Profile"))
                }
                
                    Button(action: {CoreDataManager.shared.saveUser(user: userInput)}) {LoginButtonContent() }
                }
             
            case .remove:
                
                VStack{
                    
               NavigationView {
                   
//                    ScrollView(.vertical,showsIndicators: false) {
                List(users) {_ in 
                            ForEach(users, id: \.self) { user in
                                UserDBDetails(user: user)
                            }
                       // .onDelete { //
                         //  }
//                        }.padding(10)
//                        }
                    }
                    .navigationBarTitle("Users")
                       .navigationBarItems(leading: deleteButton, trailing: editButton)
                       .environment(\.editMode, self.$editMode)
               }
                    
                    
                
                }
            }
        }
                         }
        
        
            
    }
    
    private var editButton: some View {
        if editMode == .inactive {
            return Button(action: {
                self.editMode = .active
                self.selection = Set<User>()
            }) {
                Text("Edit")
            }
        }
        else {
            return Button(action: {
                self.editMode = .inactive
                self.selection = Set<User>()
            }) {
                Text("Done")
            }
        }
    }
    
    private var deleteButton: some View {
        if editMode == .inactive {
            return Button(action: {}) {
                Image(systemName: "")
            }
        } else {
            return Button(action: deleteItems) {
                Image(systemName: "trash")
            }
        }
    }
    
    private func deleteItems() {
        for id in selection {
            if let index = users.lastIndex(where: { $0 == id })  {
                Text("\(id)")//CoreDataManager.shared.deleteUser(name: user.nameW)
            }
        }
        selection = Set<User>()
    }
    
    
    
    
    
    
    
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

struct LoginButtonContent : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            //change
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}


enum TabLogin: Tab {
        case add,remove
    
    func title() -> String {
        switch self {
        case .add:
            return "Add User"
        case .remove:
            return "Remove User"
            
        }
    }
}
    


struct loginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
