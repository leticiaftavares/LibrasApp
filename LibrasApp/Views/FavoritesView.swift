//
//  FavoritesView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//


import Foundation
import SwiftData
import SwiftUI
import Nuvem

struct FavoritesView: View {
    @State var signs: [Sign.Observable] = []
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                VStack{
                    ForEach(signs){ sign in
                        VStack {
                            
                            NavigationLink(destination: SignalView(sign: sign)) {
                                FavoriteButton(sign: sign)
                            }
                            .padding(.top, 15)
                            Spacer()
                        }
                        
                    }
                }
                .navigationTitle(Text("Favoritos"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .task{
                    do {
                        self.signs = try await Sign.query(on: .default)
                            .field(exclude: \.$video)
                            .all()
                            .map(\.observable)
                    } catch {
                        print(error)
                    }
                    
                }
            }
            .background(Color.blueBackground)
        }
    }
}

#Preview {
    FavoritesView()
}
