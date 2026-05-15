//
//  TabView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import SwiftUI
import SwiftData

struct TabView_: View {
    var body: some View {

            TabView {
                Tab("Categories", systemImage: "rectangle.grid.2x2.fill"){
                    CategoriesView()
                }
                Tab("Favorites", systemImage: "heart.fill"){
                    FavoritesView()
                    
                }
//                Tab("Histórico", systemImage: "book"){
//                    HistoryView()
//                }
//                
//                Tab("Search", systemImage: "magnifyingglass", role: .search){
//                   SearchView()
//                }
                
            }
        
    }
}

#Preview {
    TabView_()
   
}
