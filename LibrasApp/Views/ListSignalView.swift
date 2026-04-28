//
//  ListSignalView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI

struct ListSignalView: View {
    @State private var showingAddSignalSheet: Bool = false

    var body: some View {
        NavigationStack{
            VStack {
            
                NavigationLink(destination: SignalView()) {
                    SignalButton()
                }
                .padding(.top, 15)
                Spacer()
            }
            .navigationTitle(Text("Categoria"))
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
        }
    }
}

#Preview {
    ListSignalView()
}
