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
    let user: User
     
    @State private var selectedRows: Set<UUID> = []
    
     
    
    var body: some View {
       
        
        
        ZStack {
           Color.black
               .edgesIgnoringSafeArea(.all)
            
            
            
            VStack{
                HStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 60, height: 30)
                    
                    Text(user.category ?? "")
                    
                    Spacer()
                }
            Spacer()
                
                NavigationView{
                    List{
                        ForEach(user.topTenArray.indices, id: \.self) { index in
                            Text("\(index+1) \(self.user.topTenArray[index].titleW)")
                        }
                .onMove(perform: move)
                }
                .navigationBarTitle("top ten list")
                .navigationBarItems(trailing: EditButton() )
                }
                
              Spacer()
                Button(action:  {appData.currentUser = user
                    print("user top ",user.topTenArray[0].title )
                }, label: {
                        LoginButtonContent()}).padding()
                     
                Spacer()
            }.foregroundColor(.white)
            
            
            
        }
    }

    
    func move(from source: IndexSet, to destination: Int) {
        var filmArray = user.topTenArray
        filmArray.move(fromOffsets: source, toOffset: destination)
        }
    
    
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}
    

struct UserDBDetails_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
       
            
        var exampleUser = User(context: managedObjectContext)
        exampleUser.name = "Red"
        exampleUser.category = "Color"
        
        return
            
        UserDBDetails(user: exampleUser)
            .environment(\.colorScheme, .dark)
        }
}

 
//ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
//  // index and item are both safe to use here
//}
//ForEach(zip(1..., people)) { number, person in
//  Text("\(number). \(person.name)")
//}

//extension Sequence {
//  func numbered(startingAt start: Int = 1) -> [Numbered<Element>] {
//    zip(start..., self)
//      .map { Numbered(number: $0.0, element: $0.1) }
//  }
//}
//extension Numbered: Identifiable where Element: Identifiable {
//  var id: Element.ID { element.id }
//}
//ForEach(people.numbered()) { numberedPerson in
//  Text("\(numberedPerson.number). \(numberedPerson.name)")
//}
