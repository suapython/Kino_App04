//
//  MyList.swift
//  Kino_App03
//
//  Created by jose francisco morales on 20/11/2020.
//

import SwiftUI

struct MyList: View {
    
    @EnvironmentObject var appData: AppData
    let screen = UIScreen.main.bounds
    
    var body: some View {
    
    ZStack {
       Color.black
           .edgesIgnoringSafeArea(.all)
        VStack{
            HeaderView()
           
            Text("Filmography").bold()
                .font(.subheadline)
                .frame(width:screen.width)
                .padding(10)
                .background(Color.red)
            
            
            
            ScrollView(.vertical,showsIndicators: false) {
                LazyVStack {
                    ForEach(appData.myList){movie in
                        RowMovieView(movie: movie).frame(height: 75)
                            
                    }
                }
            }
    
            
   
            
        }.foregroundColor(.white)
    
        
        
    }
    }
}
        struct MyList_Previews: PreviewProvider {
            static var previews: some View {
        MyList().environmentObject(AppData())
    }
}
