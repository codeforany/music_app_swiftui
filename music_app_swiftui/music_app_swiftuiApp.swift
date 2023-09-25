//
//  music_app_swiftuiApp.swift
//  music_app_swiftui
//
//  Created by CodeForAny on 21/08/23.
//

import SwiftUI

@main
struct music_app_swiftuiApp: App {
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                MainTabView()
            }
            .navigationViewStyle(.stack)
            
        }
    }
}
