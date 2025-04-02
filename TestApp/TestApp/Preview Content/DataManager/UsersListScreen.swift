//
//  UsersListScreen.swift
//  TestApp
//
//  Created by Ваня Науменко on 2.04.25.
//

// UsersListScreen.swift
import SwiftUI
import CoreData

struct UsersListScreen: View {
    @EnvironmentObject var appState: AppState
    @State private var users: [NSManagedObject] = []
    
    var body: some View {
        NavigationView {
            List {
//                ForEach($users, id: \.self) { user in
//                    if let email = user.email {
//                        NavigationLink {
//                            AuthorizationScreen(userEmail: email)
//                        } label: {
//                            Text(email)
//                        }
//                    }
//                }
            }
            .navigationTitle("Пользователи")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        RegistrationScreen()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                users = CoreDataManager.shared.fetchUsers()
            }
        }
    }
}

#Preview {
    UsersListScreen()
}
