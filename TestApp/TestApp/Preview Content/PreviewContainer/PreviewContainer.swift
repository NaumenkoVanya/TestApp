//
//  PreviewContainer.swift
//  TestApp
//
//  Created by Ваня Науменко on 3.04.25.
//

import SwiftUICore
import SwiftUI

struct PreviewContainer<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .environmentObject(AppState())
            .environment(\.managedObjectContext, CoreDataManager.shared.context)
    }
}
