//
//  CategorieViwe.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftUI
import SwiftData
import Nuvem

struct CategoriesView: View {
    var categories: [String] = ["Metodologia", "Ferramentas", "Código", "Negócios"]
    var body: some View {
        
        NavigationStack{
            VStack {
                
                Grid(horizontalSpacing: 10, verticalSpacing: 20) {
                    GridRow {

                        NavigationLink( destination: ListSignalView(categoryView: categories[0]), label: {
                            CategoryButton(category: categories[0], image: "symbolCBL")
                        })
                        NavigationLink( destination: ListSignalView(categoryView: categories[1]), label: {
                            CategoryButton(category: categories[1], image: "symbolSettings")
                        })
                        
                    }
                    
                    GridRow {
                        NavigationLink( destination: ListSignalView(categoryView: categories[2]), label: {
                            CategoryButton(category: categories[2], image: "symbolCode")
                        })
                        NavigationLink( destination: ListSignalView(categoryView: categories[3]), label: {
                            CategoryButton(category: categories[3], image: "symbolBusniess")
                        })
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 15)
                Spacer()
                    .navigationTitle(Text("Categorias"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.blueBackground)
            
        }
    }

}

#Preview {
    CategoriesView()
        .modelContainer(for: Palavra.self, inMemory: true)
}
