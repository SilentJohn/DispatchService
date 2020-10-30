//
//  MainView.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 9/28/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State var selectedIndex: TabType = .dispatch
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                NavigationLink(destination: DispatchView(tabSelectedIndex: $selectedIndex)) {
                    Text("我要派单")
                        .padding()
                        .frame(width: 200.0, height: 100.0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .tabItem {
                    Image("plus")
                    Text("派单")
                }
                .tag(TabType.dispatch)
                
                OrderList(dataSource: [
                    .init(id: 0, type: .barber, startDate: .init(), endDate: .init(timeIntervalSinceNow: 60 * 60), status: .pending),
                    .init(id: 1, type: .barber, startDate: .init(timeIntervalSinceNow: -60 * 60), endDate: .init(), status: .ongoing),
                    .init(id: 2, type: .barber, startDate: .init(timeIntervalSinceNow: -120 * 60), endDate: .init(timeIntervalSinceNow: -60 * 60), status: .done)
                ])
                    .tabItem {
                        Image("order")
                        Text("订单")
                    }
                    .tag(TabType.order)
                
                List {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("John")
                    }
                }
                .navigationTitle(Text("User"))
                .tabItem {
                    Image("mine")
                    Text("我的")
                }
                .tag(TabType.profile)
            }
            .fullScreenCover(isPresented: $userSettings.needLogin) {
                LoginView()
                    .environmentObject(userSettings)
            }
        }
    }
    
    enum TabType: Int, Hashable {
        case dispatch, order, profile
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserSettings())
    }
}
