

//
//  AZAlert.swift
//  HelloAlertSwiftUI
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//
import SwiftUI

struct AlertView: View {
    
    let screenSize = UIScreen.main.bounds
    var title: String
    var message: String
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in
        
    }
    var onCancel: () -> Void = { }
    
    
    var body: some View {
    
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
               .foregroundColor(.white)
            Text(message)
                .font(.headline)
               .foregroundColor(.white)
            TextField("", text: $text)
                .padding(7)
                .padding(.leading, -7)
                .background(Color.graySearchBakground)
                .cornerRadius(8)
                .foregroundColor(.white)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                
            HStack(spacing: 20) {
                Button("Done") {
                    self.isShown = false
                    self.onDone(self.text)
                }.foregroundColor(.blue)
                Button("Cancel") {
                    self.isShown = false
                    self.onCancel()
                }.foregroundColor(.red)
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
        .background(Color.black)
        .opacity(0.9)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .offset(y: isShown ? 0 : screenSize.height)
       .animation(.spring())
        .shadow(color: Color(.lightGray), radius: 6, x: -2, y: -2)
        

    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
        AlertView(title: "Title", message: "Message", isShown: .constant(true), text: .constant(""))
        }
    }
}
 
 

//struct AlertView: View {
//
//    @State private var showAlert: Bool = false
//    @State private var text: String = ""
//    @State private var items = (1...5).map { "\($0)" }
//
//
//    var body: some View {
//
//        NavigationView {
//
//            ZStack(alignment: .center) {
//                VStack {
//                    List(self.items, id: \.self) { index in
//                        Text("\(index)")
//                    }
//                    Button("Show Alert") {
//                        self.text = ""
//                        self.showAlert = true
//                    }
//
//                    Text(text)
//                }
//                AZAlert(title: "Add Item", isShown: $showAlert, text: $text, onDone: { text in
//                    self.items.append(text)
//                    })
//
//            }
//
//            .navigationBarTitle("Add Item")
//            .navigationBarItems(trailing: Button("Add Item") {
//                self.showAlert = true
//            })
//
//        }
//    }
//}
//
//struct AlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertView()
//    }
//}
//
//
//
//
