//
//  HeaderView.swift
//  Kino_App04
//
//  Created by jose francisco morales on 14/12/2020.
//

import SwiftUI

struct HeaderView: View {
    let screen = UIScreen.main.bounds
    
    var body: some View {
        Image("knhoscope2")
                        .resizable()
                       .scaledToFit()
                      .frame(width: screen.width)
                      .edgesIgnoringSafeArea(.all)
            
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
