//
//  ContentView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var palavras: [Palavra]

    var body: some View {
        CategoriesView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Palavra.self, inMemory: true)
}
