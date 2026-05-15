//
//  SearchButton.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        NavigationStack {
            Form {
                VStack{
//                    NavigationLink(
//                        destination: SignalView()
//                    ){
                        HStack{
                            Text("Sinal")
                                .font(Font.system(size: 22).bold())
                                .foregroundColor(.bluetitles)
                                .padding(.horizontal, 5)
//                            TagButton()

                        }
                        .contentShape(Rectangle())
                        .frame(width:320, height: .infinity, alignment: .leading)
                        .background(Color(.white))
                        .cornerRadius(16)
                    }
                }
            }
        }
    
    }
//}

#Preview {
    SearchButton()
}
