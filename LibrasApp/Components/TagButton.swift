//
//  TagButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI
import Nuvem

struct TagButton: View {
    @Bindable var sign: Sign.Observable
    var body: some View {
        ForEach(sign.tag, id: \.self){ singletag in
            Label(singletag, systemImage: "tag.fill")
                .padding()
                .frame(height: 32)
    //            .frame(maxWidth: 160)
                .background(Color(.bluetag))
                .cornerRadius(30)
                .foregroundStyle(Color(.blueprincipal))
        }

    }
}

struct TagButton_Preview: View {
    var body: some View {
        TagButton(
            sign: Sign(
                name: "name",
                video: nil,
                category: "category",
                handSettings: [UIImage()],
                meaning: "meaning",
                tag: ["tag"],
                fullName: "fullName",
                approved:  "true",
                isFavorite: false
            ).observable
        )
    }
}


#Preview {
    TagButton_Preview()
}
