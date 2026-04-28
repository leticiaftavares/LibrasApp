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
    @CKAssetField("handSettings")
    var handSettings: UIImage?
    @CKField("meaning")
    var meaning: String
    @CKField("tag")
    var tag: String


}


import SwiftUI

struct AllSignsView: View {
    
    @State var signs: [Sign] = []
    
    var body: some View {
        List {
            ForEach(signs) { sign in
                VStack {
                    Text(sign.name)
//                    Text(sign.meaning)
                    if let video = sign.video {
                        Text(video.description)
                        Text(sign.category)
                        Text(sign.meaning)
                    }
                }
            }
        }
        .task {
            do {
                signs = try await Sign.query(on: .default).all()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    AllSignsView()
}
