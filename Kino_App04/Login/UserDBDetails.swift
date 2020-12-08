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
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
     
    
    @EnvironmentObject var appData: AppData
    
    let user: User
     
    @State private var selectedRows: Set<UUID> = []
    
    
    var body: some View {
        
        GeometryReader { proxy in
            
                HStack {
                    Text("Hello")
                    Text(user.nameW)
                        .bold()
                        .font(.system(size: 14))
                    }.font(.caption)
            
        }
    }
}

        
    

struct UserDBDetails_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        
        
        let user = User(context: moc)
        user.name = "Woody"
         
        
         
      return UserDBDetails(user: user )
        }
}
