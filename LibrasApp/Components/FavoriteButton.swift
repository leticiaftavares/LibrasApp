//
//  FavoriteButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI
import Nuvem

struct FavoriteButton: View {
    @State var toggled = false
    @Bindable var sign: Sign.Observable
    
    var body: some View {
        HStack{
            VStack {
                Text(sign.name)
                    .font(Font.system(size: 22).bold())
                    .foregroundStyle(Color(.bluetitles))
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                HStack {
                    TagButton(sign: sign)
                }                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
            }
            Spacer()
                Button(action: {
                    toggled.toggle()
                }){Image(systemName: toggled == true ? "heart" :"heart.fill")
                        .padding()
                        .font(Font.system(size: 20))
                        .background(Color(.white))
                        .clipShape(Circle())
                        .foregroundStyle(Color(.bluetitles))
                        .shadow(radius: 1)
                }
        }
        .contentShape(Rectangle())
        .frame(width:340, height: .infinity, alignment: .leading)
        .padding()
        .background(Color(.white))
        .cornerRadius(16)
        .shadow(radius: 1)
    }

}

struct FavoriteButton_Preview: View {
    var body: some View {
        FavoriteButton(
            sign: Sign(
                name: "Sinal",
                video: nil,
                category: "category",
                handSettings: [UIImage()],
                meaning: "meaning",
                tag: ["tag"],
                fullName: "fullName"
            ).observable
        )
    }
}

#Preview {
    FavoriteButton_Preview()
}
