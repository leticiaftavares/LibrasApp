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
                
                Grid(horizontalSpacing: 15, verticalSpacing: 15) {
                    GridRow {

                        NavigationLink( destination: ListSignalView(categoryHome: categories[0]), label: {
                            CategoryButton(category: categories[0], image: "symbolCBL", numSign: "19 Sinais")
                        })
                        NavigationLink( destination: ListSignalView(categoryHome: categories[1]), label: {
                            CategoryButton(category: categories[1], image: "symbolSettings", numSign: "6 Sinais")
                        })
                        
                    }
                    
                    GridRow {
                        NavigationLink( destination: ListSignalView(categoryHome: categories[2]), label: {
                            CategoryButton(category: categories[2], image: "symbolCode", numSign: "3 Sinais")
                        })
                        NavigationLink( destination: ListSignalView(categoryHome: categories[3]), label: {
                            CategoryButton(category: categories[3], image: "symbolBusniess", numSign: "2 Sinais")
                        })
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 15)
                Spacer()
                    .navigationTitle(Text("Categorias"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Image("background")
                .resizable()
                .frame(width: 400, height: 1000)
            )
        }
    }

}

#Preview {
    CategoriesView()
}
