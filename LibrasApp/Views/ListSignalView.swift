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
    var body: some View {
        NavigationStack {
            Text("lista de sinais")
                .navigationTitle(Text("Categoria"))
        }
    }
}

#Preview {
    ListSignalView()
}
