//
//  SearchView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            Text("pesquisando \(searchText)")
            .navigationTitle(Text("Pesquisa"))
            .searchable(text: $searchText)

        }
    }
}

#Preview {
    SearchView()
}
