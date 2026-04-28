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
            VStack {
                NavigationLink(destination: {
                    SignalView()
                }, label: {
                    SearchButton()
                })
                .padding(.top,15)
                Spacer()
            }
                .navigationTitle(Text("Pesquisa"))
                .searchable(text: $searchText)
                .padding(.top, 10)
        }

    }
}


#Preview {
    SearchView()
}
