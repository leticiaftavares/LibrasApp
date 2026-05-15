//
//  ExpandedButton.swift
//  LibrasApp
//
//  Created by User on 29/04/26.
//

import SwiftUI

struct ExpandedButton: View {
    @Binding var isExpanded: Bool
    var body: some View {
        Button(action: {
            withAnimation {
                isExpanded.toggle()
            }
        }) {
            Image(systemName: "chevron.right")
                .rotationEffect(
                    !isExpanded ? Angle(degrees: 0) : Angle(degrees: 90)
                )
        }
        .frame(width: 20, height: 20)
    }
}

#Preview {
    @Previewable @State var isExpanded: Bool = false
    ExpandedButton(isExpanded: $isExpanded)
}
