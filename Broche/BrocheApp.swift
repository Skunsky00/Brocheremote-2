//
//  BrocheApp.swift
//  Broche
//
//  Created by Jacob Johnson on 12/8/22.
//

import SwiftUI
import Firebase

@main
struct BrocheApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView2().environmentObject(AuthViewModel.shared)
        }
    }
}
