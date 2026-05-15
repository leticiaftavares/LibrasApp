//
//  SignalButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI
import Nuvem
import CloudKit

struct SignalButton: View {
    
    @AppStorage("favorites") var favorites = FavoriteSigns()

    @Bindable var sign: Sign.Observable
    
    
    var isFavorite: Bool {
        favorites.contains(sign.id)
    }
    
    var body: some View {
        
        HStack{
            VStack {
                Text(sign.name)
//                    .font(Font.system(size: 22).bold())
                    .bold()
                    .foregroundStyle(Color(.bluetitles))
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                HStack {
                    TagButton(sign: sign)
                }
                .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
            }

            Spacer()
                Button(action: {
                    favorite()
  
                }){Image(systemName: isFavorite == true ? "heart.fill" :"heart")
                        .padding()
                        .font(Font.system(size: 20))
                        .background(Color(.white))
                        .clipShape(Circle())
                        .foregroundStyle(Color(.bluetitles))
                        .shadow(radius: 1)
                }
        }
        .contentShape(Rectangle())
        .frame(maxWidth:340, maxHeight: .infinity, alignment: .leading)
        .padding()
        .background(Color(.white))
        .cornerRadius(16)
        .shadow(radius: 1)
    }
    
    func favorite() {
        if favorites.contains(sign.id) {
            favorites.remove(sign.id)
        } else {
            favorites.insert(sign.id)
        }
//        var sign = sign.model
//        sign.isFavorite = true
//        do {
//            try await sign.save(on: .default)
//        } catch {
//            print(error)
//        }
    }
}

struct SignalButton_Preview: View {
    var body: some View {
        SignalButton(
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
    SignalButton_Preview()
}
