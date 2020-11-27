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
       
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack {
                        ForEach(vm.movie.cast){item in
                            VStack{
                       CastItemView(castItem: item)
                        .frame(width:90, height: 100)
                                Text(item.name)
                                Text(item.character).font(.caption)
                                    .foregroundColor(.gray)
                            }.foregroundColor(.white)
                            .scaledToFit()
                            .frame(width:90)
                            .onTapGesture(perform: {
                                appData.personDetailToShow = item.id
                                appData.movieDetailToShow = nil
                            })
                            
                        }
                    }
                }
                
            }
            
}
    

struct CastItemView: View {
    var castItem: CastItem
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(ImagePath.original.path(poster: castItem.profile_path ?? noimage))
                .resizable()
                .scaledToFit()
                //.aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}



struct CastStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                LazyVStack{
                    RowCast(vm: MovieDetailVM(movieId: 11030)  )}}
        }
    }
}
