//
//  ListAppTestApp.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import FirebaseCore
import SwiftUI

@main
struct ListAppTestApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
