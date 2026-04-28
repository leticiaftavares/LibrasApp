//
//  CategorieViwe.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var palavras: [Palavra]
    var body: some View {
        
        NavigationStack{
            Grid(horizontalSpacing: 10, verticalSpacing: 20) {
                GridRow {
                    NavigationLink( destination: ListSignalView(), label: {
                        CategoryButton()
                    })
                    NavigationLink( destination: ListSignalView(), label: {
                        CategoryButton()
                    })
                                    
                }
                
                GridRow {
                    NavigationLink( destination: ListSignalView(), label: {
                        CategoryButton()
                    })
                    NavigationLink( destination: ListSignalView(), label: {
                        CategoryButton()
                    })
                                    
                }
                
            }
            .padding(.top, 15)
            Spacer()
            .navigationTitle(Text("Categorias"))
            
        }
    }

}

#Preview {
    CategoriesView()
        .modelContainer(for: Palavra.self, inMemory: true)
}
