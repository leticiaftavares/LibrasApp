//
//  MeaningButton.swift
//  LibrasApp
//
//  Created by User on 29/04/26.
//

import SwiftUI
import Nuvem

struct HandSettingsButton: View {
    @State private var isExpanded = false
    @Bindable var sign: Sign.Observable
    var body: some View {
        VStack {
            HStack{
                Text("Configuração de Mão")
                    .font(Font.system(size: 22).bold())
                    .foregroundStyle(Color(.bluetitles))
                    .frame(maxWidth: 330, alignment: .init(horizontal: .leading, vertical: .top))

                Spacer()
                ExpandedButton(isExpanded: $isExpanded)
            }
            .frame(maxWidth: 330, alignment: .init(horizontal: .leading, vertical: .top))
            if isExpanded {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 3), spacing: 20) {
                    ForEach(sign.handSettings, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .font(Font.system(size: 18))
                            .foregroundStyle(Color(.bluetitles))
                            .aspectRatio(1, contentMode: .fill)
                            
                    }
                }
                .padding(30)
                .frame(maxWidth: .infinity)
                .background(Color(.white))
                .cornerRadius(16)
            }
        }
        .frame(maxWidth: 330, alignment: .init(horizontal: .leading, vertical: .top))
    }
}

struct HandSettingsButton_Preview: View {
    
    @State private var sign = Sign(
        name: "Sinal",
        video: nil,
        category: "category",
        handSettings: [
            UIImage(named: "c1")!,
            UIImage(named: "c2")!,
            UIImage(named: "c3")!,
            UIImage(named: "c4")!,
        ],
        meaning: "meaning",
        tag: ["tag"],
        fullName: "fullName",
        approved:  "true",
        isFavorite: false
    )
    
    var body: some View {
        SignalView(
            sign: sign.observable
        )
    }
}

#Preview {
    HandSettingsButton_Preview()
}
