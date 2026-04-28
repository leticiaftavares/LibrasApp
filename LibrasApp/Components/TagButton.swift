//
//  TagButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct TagButton: View {
    var body: some View {
        Label("tag", systemImage: "tag.fill")
            .padding()
            .frame(width: .infinity, height: 35)
            .background(Color(.bluetag))
            .cornerRadius(30)
            .foregroundStyle(Color(.bluesearch))
    }
}

#Preview {
    TagButton()
}
