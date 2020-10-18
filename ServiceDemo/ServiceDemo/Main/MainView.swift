//
//  MainView.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 9/28/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(0..<10) { i in
                        Text("\(i)")
                    }
                }
                .navigationTitle(Text("List of Items"))
            }
            .tabItem {
                Text("List")
            }
            
            NavigationView {
                List {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("John")
                    }
                }
                .navigationTitle(Text("User"))
            }
            .tabItem {
                Text("User")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
