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
                .frame(width: 75, height:120)
                .onTapGesture(perform: {
                    appData.personDetailToShow = person.personId
                    })
            VStack(alignment: .leading, spacing:0){
                Text(person.name).bold()
                    .font(.system(size: 18))
                Text(person.job)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(person.biography ?? "").font(.caption)
                    .lineLimit(4)
                    }
                Spacer()
                }
        
        
//        GeometryReader { proxy in
//            HStack {
//                KFImage(ImagePath.medium.path(poster: person.profile_pathP))
//                    .resizable()
//                    .frame(width: 70,height:100)
//                   // .padding(.leading, 3)
//
//                VStack(alignment: .leading){
//                    Text(person.name).bold()
//                    Text(person.known_for_departmentP)
//                        .font(.caption)
//                        //.foregroundColor(.gray)
//                    Text(person.biographyP)
//                    .font(.caption)
//                        .lineLimit(3)
//                        .foregroundColor(.gray)
//                }
//
//            }
//            .foregroundColor(.white)
//            .onTapGesture(perform: {
//                appData.movieDetailToShow = nil
//                appData.personDetailToShow = person.personId
//            })
//        }
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
