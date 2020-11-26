//
//  CustomTabView.swift
//  Kino_App03
//
//  Created by jose francisco morales on 21/11/2020.
//

import SwiftUI


struct CustomTabView<T: Tab>: View {
    
    var tabs: [T]
    @Binding var currentTab: T
    var action: ()-> Void
    
        var body: some View {
            LazyVStack {
                // Tab picker
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        
                        ForEach(tabs, id: \.self) { tab in
                            VStack {
                                Spacer()
                                // Button
                                Button(action: {
                                    currentTab = tab
                                    self.action()
                                }, label: {
                                    Text(tab.title() )
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                                })
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: widthForTab(tab), height: 0)
                                // Red Bar
                                Rectangle()
                                    .frame(width: widthForTab(tab), height: 6)
                                    .foregroundColor(tab == currentTab ? Color.red : Color.clear)
                            }
                    }
                      
                }
                    .foregroundColor(.white)
           
        }
      
            }
        }
                
    func widthForTab<T: Tab>(_ tab: T)  -> CGFloat {
                    let string = tab.title()
                    return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
                }
                
                
        
    }
        
      
struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {Color.black
            .edgesIgnoringSafeArea(.all)
            CustomTabView(tabs: [TabSearch.movie, TabSearch.person], currentTab: .constant(TabSearch.movie),action: {print("tap")} )
        }
    }
}
