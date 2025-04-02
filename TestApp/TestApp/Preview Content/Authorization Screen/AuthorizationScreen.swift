//
//  AuthorizationScreen.swift
//  TestApp
//
//  Created by Ваня Науменко on 2.04.25.
//

// AuthorizationScreen.swift
import SwiftUI

struct AuthorizationScreen: View {
    @EnvironmentObject var appState: AppState
    let userEmail: String
    
    @State private var password = ""
    @State private var errorMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Авторизация")
                .font(.largeTitle)
                .padding(.bottom, 30)
            
            Text(userEmail)
                .font(.headline)
                .padding(.bottom, 10)
            
            SecureField("Пароль", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: authorize) {
                Text("Авторизоваться")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Авторизация", displayMode: .inline)
    }
    private func authorize() {
        errorMessage = ""
        
        guard let user = CoreDataManager.shared.findUser(email: userEmail) else {
            errorMessage = "Пользователь не найден"
            return
        }
        
        // Для варианта с User классом:
//        if user.password == password {
//            appState.currentUserEmail = userEmail
//            appState.isLoggedIn = true
//        } else {
//            errorMessage = "Неверный пароль"
//        }
        
        // Или для варианта с NSManagedObject:
        if let userPassword = user.value(forKey: "password") as? String,
           userPassword == password {
            appState.currentUserEmail = userEmail
            appState.isLoggedIn = true
        } else {
            errorMessage = "Неверный пароль"
        }
    }
//    private func authorize() {
//        errorMessage = ""
//        
//        guard let user = CoreDataManager.shared.findUser(email: userEmail) else {
//            errorMessage = "Пользователь не найден"
//            return
//        }
//        
//        if user.password == password {
//            appState.currentUserEmail = userEmail
//            appState.isLoggedIn = true
//        } else {
//            errorMessage = "Неверный пароль"
//        }
//    }
}
#Preview {
    AuthorizationScreen( userEmail: "kjbfwk@mail.com")
}
