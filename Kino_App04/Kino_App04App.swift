//
//  Kino_App04App.swift
//  Kino_App04
//
//  Created by jose francisco morales on 26/11/2020.
//

import SwiftUI

@main
struct Kino_App04App: App {
    let context = PersistentCloudKitContainer.persistentContainer.viewContext
    var body: some Scene {
            WindowGroup {
                    ContentView().environment(\.managedObjectContext, context)
            }
    }
}
