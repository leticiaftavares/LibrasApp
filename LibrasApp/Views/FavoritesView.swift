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
    
    @AppStorage("favorites") var favorites = FavoriteSigns()
    
    @State var signs: [Sign.Observable] = []
    
    var favoriteSigns: [Sign.Observable] {
        signs.filter { sign in
            favorites.contains(sign.id)
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                VStack{
                    ForEach(favoriteSigns){ sign in
                        VStack {
                            
                            NavigationLink(destination: SignalView(sign: sign)) {
                                SignalButton(sign: sign)
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
            .background(Image("background")
                .resizable()
                .frame(width: 400, height: 1000)
            )
        }
    }
}

#Preview {
    FavoritesView()
}
