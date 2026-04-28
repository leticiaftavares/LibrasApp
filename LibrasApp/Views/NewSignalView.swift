//
//  NewSignalView.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData
import SwiftUI

struct NewSignalView: View {
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack {
            Text("New Signal View")
                .navigationTitle(Text("New Signal"))
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Dismiss", systemImage: "xmark"){
                            isPresented = false
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Send", systemImage: "checkmark"){

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
