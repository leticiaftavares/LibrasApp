//
//  CategoryButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct CategoryButton: View {
    var category: String
    var image: String
    var numSign: String
    var body: some View {

            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Image(image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.horizontal,5)
                }
                
                Text(numSign)
                    .font(Font.system(size: 16))
                Text(category)
                    .font(Font.system(size: 20).bold())
            }
            .foregroundStyle(Color(.bluetitles))
            .contentShape(Rectangle())
            .frame(width: 145, height: .infinity, alignment: .leading)
                .padding()
                .background(Color(.white))
                .cornerRadius(16)
                .shadow(radius: 1)
        }

}

#Preview {
    @Previewable @State var category: String = "Sinais"
    @Previewable @State var image: String = "Image"
    @Previewable @State var numSign: String = "2 Sinais"

    CategoryButton(category: category, image: image, numSign: numSign)
}
