//
//  Item.swift
//  LibrasApp
//
//  Created by User on 24/04/26.
//

import Foundation
import SwiftData

@Model
 class Palavra {
     var name: String
     var meaning: String
     var tag: Tag
    
     init(
        name: String,
        meaning: String,
        tag: Tag
     ) {
         self.name = name
         self.meaning = meaning
         self.tag = tag
     }
}

enum Tag: CaseIterable, Identifiable, Codable {
    case ferramentas, apresentacao, desenvolvimento
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .ferramentas: return "Ferramentas"
        case .apresentacao: return "Apresentação"
        case .desenvolvimento: return "Desenvolvimento"
        }
    }
}
