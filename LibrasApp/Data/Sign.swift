//
//  Sign.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import Foundation
import CloudKit
import Nuvem

@CKModel
struct Sign {
    @CKField("name")
    var name: String
    @CKAssetField("video")
    var video: Data?
    @CKField("category")
    var category: String
    @CKAssetListField("handSettings")
    var handSettings: [UIImage]
    @CKField("meaning")
    var meaning: String
    @CKField("tag")
    var tag: [String]
    @CKField("fullName")
    var fullName: String?


}


import SwiftUI

struct AllSignsView: View {
    
    @State var signs: [Sign.Observable] = []
//    @State var category: String = ""
    
    var body: some View {
        List{
            ForEach(signs){ sign in
//                SignalView(sign: sign)
            }
        }
        .task{
            do {
                self.signs = try await Sign.query(on: .default)
                    .field(exclude: \.$video)
                    .all()
                    .map(\.observable)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    AllSignsView()
}
