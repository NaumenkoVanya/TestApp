//
//  UserAuthApp.swift
//  TestApp
//
//  Created by Ваня Науменко on 2.04.25.
//

// UserAuthApp.swift
import SwiftUI

@main
struct UserAuthApp: App {
    @StateObject private var appState = AppState()
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showSplash {
                    SplashScreen()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    if appState.isLoggedIn {
                        MainScreen()
                            .environmentObject(appState)
                    } else {
                        UsersListScreen()
                            .environmentObject(appState)
                    }
                }
            }
        }
    }
}
