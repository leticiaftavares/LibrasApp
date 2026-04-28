//
//  Database.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import CloudKit

extension CKDatabase {
    static let `default` = CKContainer(
        identifier: "iCloud.com.LeticiaTavares.LibrasApp"
    )
    .publicCloudDatabase
}
