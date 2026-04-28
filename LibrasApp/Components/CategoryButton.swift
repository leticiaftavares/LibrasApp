//
//  CategoryButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct CategoryButton: View {
    var body: some View {

            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Image("symbolSettings")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .padding(.horizontal,5)
                }
                
                Text("Sinais")
                    .font(Font.system(size: 16))
                Text("Categoria")
                    .font(Font.system(size: 20))
            }
            .foregroundStyle(Color(.bluetitles))
            .contentShape(Rectangle())
            .frame(width: 155, height: .infinity, alignment: .leading)
                .padding()
                .background(Color(.white))
                .cornerRadius(16)
                .shadow(radius: 1)
        }

}

#Preview {
    CategoryButton()
}
