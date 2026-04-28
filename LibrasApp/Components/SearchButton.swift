//
//  SearchButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        HStack{
            Text("Sinal")
                .font(Font.system(size: 22).bold())
                .foregroundColor(.bluetitles)
            TagButton()
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(Color(.bluesearch))
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
    SearchButton()
}
