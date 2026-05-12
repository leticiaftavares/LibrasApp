//
//  ListSignalView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI
import Nuvem

struct ListSignalView: View {
    var categoryHome: String
    @State var signs: [Sign.Observable] = []
    @State var favorites: [Sign.Observable] = []
    @State var isFavorite: Bool = true

    @State private var showingAddSignalSheet: Bool = false
    
    var body: some View {
        NavigationStack{
           VStack{
               ScrollView(.vertical) {
                   VStack{
                       ForEach(signs){ sign in
                           let category = sign.category

                           if(categoryHome == category && sign.approved == "true"){
                               VStack {
                                   NavigationLink(destination: SignalView(sign: sign)) {
                                       SignalButton(sign: sign)
                                   }
                                   .padding(.top, 8)
                                   Spacer()
                               }
                           }
                       }
                   }
                   
                   .navigationTitle(Text(categoryHome))
                   .toolbar{
                       ToolbarItem(placement: .navigationBarTrailing) {
                           Button("Add", systemImage: "plus") {
                               showingAddSignalSheet.toggle()
                           }
                       }
                   }
                   .sheet(isPresented: $showingAddSignalSheet){
                       NewSignalView(isPresented: $showingAddSignalSheet)
                   }
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
            }
           .background(Image("background")
               .resizable()
               .ignoresSafeArea()
           )
        }
    }
}

#Preview {
    @Previewable @State var categoryHome = "Ferramentas"
    ListSignalView(categoryHome: categoryHome)
}
