//
//  FavoritesView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//


import Foundation
import SwiftData
import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack{
            VStack {
            
                NavigationLink(destination: SignalView()) {
                    FavoriteButton()
                }
                .padding(.top, 15)
                Spacer()
            }
            .navigationTitle(Text("Favoritos"))
        }
    }
}

#Preview {
    FavoritesView()
}
