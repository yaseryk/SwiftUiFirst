//
//  TabBar.swift
//  DesignCodeSwiftUI
//
//  Created by Yaser on 8/28/20.
//  Copyright © 2020 Yaser. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                
                Image(systemName: "house.fill")
                
                Text("Home")
            }
            
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                
                Text("Certificates")
            }
            
            Home().tabItem {
                Image(systemName: "person")
                
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone Xs")
            .environmentObject(UserProfile())
          //  TabBar().previewDevice("iPhone SE")
        }
    }
}
