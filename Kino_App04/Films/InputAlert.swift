//
//  InputAlert.swift
//  Kino_App04
//
//  Created by jose francisco morales on 19/12/2020.
//

import SwiftUI

struct InputAlert: View {
        
        @Binding var isShown: Bool
        @Binding var newUser: UserData
    
         let screenSize = UIScreen.main.bounds
         var title: String = "Add User"
       
         var onDone: (UserData) -> Void = { _ in }
         var onCancel: () -> Void = { }
        
        
        var body: some View {
        
            VStack(spacing: 5) {
                Text(title)
                    .font(.headline)
                Text("Enter user name and category")
                TextField("", text: $newUser.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Picker(selection: $newUser.category, label: Text("Category")) {
                    ForEach(Category.allCategories, id: \.self) { category in
                        Text(category)}
                }
                HStack(spacing: 20) {
                    Button("Done") {
                        self.isShown = false
                        self.onDone(self.newUser)
                    }
                    Button("Cancel") {
                        self.isShown = false
                        self.onCancel()
                    }
                }
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.5)
            .background(Color("LightGray"))
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .offset(y: isShown ? 0 : screenSize.height)
            .animation(.spring())
            .shadow(color: Color("SecondaryColor"), radius: 6, x: -9, y: -9)

        }
    }

struct Category {
    static let allCategories = [
        "User",
        "Color",
        "Director"
    ]
}




struct InputAlert_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {Color.black
                .edgesIgnoringSafeArea(.all)
            InputAlert(isShown: .constant(true), newUser: .constant(UserData() ))
            }
        }
    
}
 
