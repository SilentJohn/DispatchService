//
//  ServiceDemoApp.swift
//  ServiceDemo
//
//  Created by Jiang, John X. -ND on 9/27/20.
//

import SwiftUI

@main
struct ServiceDemoApp: App {
//    let persistenceController = PersistenceController.shared
    var userSettings: UserSettings = .init()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(userSettings)
        }
    }
}
