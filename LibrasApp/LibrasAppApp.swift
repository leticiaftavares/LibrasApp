//
//  LibrasAppApp.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import SwiftUI
import SwiftData

@main
struct LibrasAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Palavra.self])
    }
}
