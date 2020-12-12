//
//  Helloworld.swift
//  Kino_App04
//
//  Created by jose francisco morales on 12/12/2020.
//

import SwiftUI

struct Helloworld: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
            print("In progress: \(inProgress)!")
        }) {
            print("Long pressed!")
        }
    }
}

struct Helloworld_Previews: PreviewProvider {
    static var previews: some View {
        Helloworld()
    }
}
