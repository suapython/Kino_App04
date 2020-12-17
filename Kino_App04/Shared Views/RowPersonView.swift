//
//  MovieRowView.swift
//  Kino_App02
//
//  Created by jose francisco morales on 01/10/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct RowPersonView: View {
    private let person: Person
    @EnvironmentObject var appData: AppData
    
    init(person: Person) {
      self.person = person
    }
    
    var body: some View {
        
        HStack{
            DisplayURLImage(urlPath: person.profile_pathP)
                .frame(width: 75, height:75)
                
            VStack(alignment: .leading, spacing:0){
                Text(person.name).bold()
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                Text(person.job)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(person.biography ?? "").font(.caption)
                    .lineLimit(4)
                    }
                 Spacer()
                }
        
    }
}

 

struct PersonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
        RowPersonView(person: examplePerson1 )
        }
    }
}
