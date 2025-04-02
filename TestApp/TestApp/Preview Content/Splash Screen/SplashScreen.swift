//
//  SplashScreen.swift
//  TestApp
//
//  Created by Ваня Науменко on 2.04.25.
//

// SplashScreen.swift
import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Image("splash_background") // Убедитесь что добавили изображение в Assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2)
        }
    }
}
