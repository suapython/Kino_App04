//
//  ListsRowStack.swift
//  Kino_App02
//
//  Created by jose francisco morales on 31/10/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct RowCast: View {
    
    @ObservedObject var vm: MovieDetailVM
    @EnvironmentObject var appData: AppData

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(vm.movie.cast) { castItem in
                    NavigationLink(
                        destination: PersonDetail(vm: PersonDetailVM(personId: castItem.id)) ) {
                        
                   VStack{
                    
                    GeometryReader { proxy in
                          KFImage(ImagePath.original.path(poster: castItem.profile_path!))
                               .resizable()
                              .scaledToFit()
                               .frame(width: proxy.size.width,
                                      height: proxy.size.height)
                                .clipped()
                    }.frame(width:90, height: 100)
                    
                    Text(castItem.name).foregroundColor(.white)
                            Text(castItem.character).font(.caption)
                                            .foregroundColor(.gray)
                            } .scaledToFit()
                   .frame(width:90)
                        }
                    }
        
                   }
               }
                
            }
            
}
    

 



struct CastStack_Previews: PreviewProvider {
    static var previews: some View {
     ZStack {Color.black
           .edgesIgnoringSafeArea(.all)
            
                    RowCast(vm: MovieDetailVM(movieId: 11030)  )
                        .colorScheme(.dark)
           }
    }
}
