//
//  AuthorizationScreen.swift
//  TestApp
//
//  Created by Ваня Науменко on 2.04.25.
//

import SwiftUI

struct AuthorizationScreen: View {
    @EnvironmentObject var appState: AppState
    let userEmail: String
    
    @State private var password = ""
    @State private var errorMessage = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AuthorizationScreen()
}
