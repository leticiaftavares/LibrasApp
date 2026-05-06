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
    @CKField("approved")
    var approved: String?
    @CKField("isFavorite")
    var isFavorite: Bool?
    
    func convertToSignCodable() -> SignCodable {
        return SignCodable(
            name: name,
            video: video,
            category: category,
            handSettings: handSettings.compactMap{
                let result = $0.pngData()
                return result
            },
            meaning: meaning,
            tag: tag,
            fullName: fullName,
            approved: approved,
            isFavorite: isFavorite
        )
    }
}

struct SignCodable: Codable {
    var name: String
    var video: Data?
    var category: String
    var handSettings: [Data]
    var meaning: String
    var tag: [String]
    var fullName: String?
    var approved: String?
    var isFavorite: Bool?
}


import SwiftUI

struct AllSignsView: View {
    
    @State var signs: [Sign.Observable] = []
//    @State var category: String = ""
    
    func decodeFrom(file: String) -> [SignCodable] {
        do {
            let jsonURl = URL.documentsDirectory.appending(path: "Signs.json")
            if FileManager().fileExists(atPath: jsonURl.path()) {
                let jsonData = try Data(contentsOf: jsonURl)
                let result = try JSONDecoder().decode([SignCodable].self, from: jsonData)
                return result
            }
        } catch {
            print(error)
        }
        return []
    }
    
    func convertToSign(decodedSigns: [SignCodable]) -> [Sign] {
        let result = decodedSigns.map { decoded in
            return Sign(
                name: decoded.name,
                video: decoded.video,
                category: decoded.category,
                handSettings: decoded.handSettings.compactMap{ data in
                    return UIImage(data: data)
                },
                meaning: decoded.meaning,
                tag: decoded.tag,
                fullName: decoded.fullName,
                approved: decoded.approved,
                isFavorite: decoded.isFavorite)
        }
        return result
    }
    
    var body: some View {
            
//            let signs = self.signs.map(\.model)
//            
//            print(signs.count)
//            
//            guard signs.isEmpty else { return }
//            
//            let result = decodeFrom(file: "Signs.json")
//            
//            print(result.count)
//            
//            let savedSigns = convertToSign(decodedSigns: result)
//            
//            print("saved signs: \(savedSigns)")
//            
//            for sign in savedSigns {
//                var sign = sign
//                do {
//                    try await sign.save(on: .default)
//                    print("Salvou no banco item do json")
//                } catch {
//                    print("NÃO salvou no banco item do json")
//                    print(error)
//                }
//                print()
//            }
            
//            do {
//                let jsonUrl = URL.documentsDirectory.appending(path: "Signs.json")
//                print(URL.documentsDirectory.path())
//                let signsData = try JSONEncoder().encode(signs.map{$0.convertToSignCodable()})
//                try signsData.write(to: jsonUrl)
//            } catch {
//                print(error)
//            }
            
//            for sign in signs {
//                var sign = sign
//                print(sign.isFavorite == nil ? "Nulo" : "Não nulo")
//                sign.isFavorite = false
//                do {
//                    let result = try await sign.save(on: .default)
//                    print("Alterou para false o is Favorite")
//                } catch {
//                    print("Não conseguiu salvar no CK")
//                    print(error)
//                }
//                print()
//            }
            
//            try? await signs.save(on: .default)
            
    }
}


#Preview {
    AllSignsView()
}
