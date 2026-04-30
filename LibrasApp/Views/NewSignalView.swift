//
//  NewSignalView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI
import SwiftUIExtras

struct NewSignalView: View {
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack {
            FormView(isPresented: $isPresented)
                .navigationTitle(Text("New Signal"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Dismiss", systemImage: "xmark"){
                            isPresented = false
                        }
                    }

                }
        }
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = true
    NewSignalView(isPresented: $isPresented)
}
