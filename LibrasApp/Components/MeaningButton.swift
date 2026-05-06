//
//  MeaningButton.swift
//  LibrasApp
//
//  Created by User on 29/04/26.
//

import SwiftUI
import Nuvem

struct MeaningButton: View {
    @State private var isExpanded = false
    @Bindable var sign: Sign.Observable
    var body: some View {
        VStack {
            HStack{
                Text("Significado")
                    .font(Font.system(size: 22).bold())
                    .foregroundStyle(Color(.bluetitles))
                    .frame(maxWidth: 330, alignment: .init(horizontal: .leading, vertical: .top))
                Spacer()
                ExpandedButton(isExpanded: $isExpanded)
            }
            .frame(maxWidth: 360, alignment: .init(horizontal: .leading, vertical: .top))
            if isExpanded {
                Text(sign.meaning)
                .font(Font.system(size: 18))
                .foregroundStyle(Color(.bluetitles))
                .frame(maxWidth: 360, alignment: .init(horizontal: .leading, vertical: .top))
                .padding()
                .background(Color(.white))
                .cornerRadius(16)
            }
            
        }
        .frame(maxWidth: 360, alignment: .init(horizontal: .leading, vertical: .top))
    }
}

struct MeaningButton_Preview: View {
    var body: some View {
        SignalView(
            sign: Sign(
                name: "Sinal",
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
    MeaningButton_Preview()
}
