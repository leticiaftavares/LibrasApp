//
//  Untitled.swift
//  LibrasApp
//
//  Created by User on 06/05/26.
//

import Foundation

typealias FavoriteSigns = Set<String>

extension FavoriteSigns: @retroactive RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(FavoriteSigns.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
