//
//  SignalButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct SignalButton: View {
    var body: some View {
        @State var toggled = false
        
        HStack{
            VStack {
                Text("Sinal")
                    .font(Font.system(size: 22).bold())
                    .foregroundStyle(Color(.bluetitles))
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                HStack {
                    TagButton()
                    TagButton()
                }                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
            }

            Spacer()
                Button(action: {
                    toggled.toggle()
                }){Image(systemName: toggled == true ? "heart.fill" :"heart")
                        .padding()
                        .background(Color(.white))
                        .clipShape(Circle())
                        .foregroundStyle(Color(.bluetitles))
                        .shadow(radius: 1)
                }
        }
        .contentShape(Rectangle())
        .frame(width:320, height: .infinity, alignment: .leading)
        .padding()
        .background(Color(.white))
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}

#Preview {
    SignalButton()
}
